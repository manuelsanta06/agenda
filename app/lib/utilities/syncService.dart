import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:agenda/database/app_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SyncService{
  static const String baseUrl = String.fromEnvironment('DOMAIN');
  static const String apiKey = String.fromEnvironment('API_KEY');

  // Headers
  static Map<String,String> get _headers => {
    'Content-Type':'application/json',
    'Authorization':'Bearer $apiKey',
  };

  static Future<(bool,String)> performFullSync(AppDatabase db) async {
    log("Syncing...");
    Map<String, dynamic> fullJson={};
    try{
      final data=await pushUnsyncedData(db);

      if(data.$1){
        log("Push successfull, Pulling..");
        final catalogData=await _fetchCatalogData();
        final eventsData=await _fetchEventsData();
        if(catalogData!=null&&eventsData!=null){
          catalogData.forEach((key,value){
            if(value!=null)fullJson[key]=value;
          });
          eventsData.forEach((key,value){
            if(value!=null)fullJson[key]=value;
          });
          await db.processFullSync(fullJson);
          
          final now = DateTime.now().toUtc().toIso8601String();
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('last_sync_catalog', now);
          await prefs.setString('last_sync_events', now);
          
          log("Sincronización completa.");
        }else{
          return (false,"Error en la descarga de datos, se abortó el guardado local.");
        }
      }else{
        return (false,"error en el push");
      }
      return data;
    }catch(e){
      log("Error de coneccion: $e");
      log(fullJson.toString());
      return (false,"error");
    }
  }

  static Future<(bool,String)> pushUnsyncedData(AppDatabase db)async{
    try{
      final payload=await db.getUnsyncedPayload();
      if(payload.values.every((list)=>(list as List).isEmpty))return (true,"successfull");
      log(jsonEncode(payload));

      //request
      final uri=Uri.https(baseUrl,'/sync');
      final response=await http.post(
        uri,
        headers:_headers,
        body:jsonEncode(payload),
      );

      if(response.statusCode==200){
        return (await db.markAsSynced(payload),"successfull");
      }else{
        log("Error en POST /sync: ${response.statusCode}");
        return (false,"${response.statusCode}\n\n${response.body}");
      }
    }catch(e){
      log("Error de conexión: $e");
      return (false,"conection error");
    }
  }

  // Internet-only functions

  static Future<Map<String, dynamic>?> _fetchCatalogData()async{
    try{
      final prefs = await SharedPreferences.getInstance();
      final lastSyncStr = prefs.getString('last_sync_catalog') ?? '2000-01-01T00:00:00Z';

      final uri = Uri.https(baseUrl, '/sync/catalog', {
        'last_sync': lastSyncStr,
      });

      final response = await http.get(uri, headers: _headers);

      if(response.statusCode == 200){
        return jsonDecode(response.body);
      } else {
        log("Error fetchCatalogData: ${response.statusCode}");
        return null;
      }
    }catch(e){
      log("Error en Catalog Sync Network: $e");
      return null;
    }
  }

  static Future<Map<String, dynamic>?> _fetchEventsData() async {
    try{
      final prefs = await SharedPreferences.getInstance();
      final lastSyncStr = prefs.getString('last_sync_events') ?? '2000-01-01T00:00:00Z';

      final uri = Uri.https(baseUrl, '/sync/events', {
        'last_sync': lastSyncStr,
      });

      final response = await http.get(uri, headers: _headers);

      if(response.statusCode == 200){
        return jsonDecode(response.body);
      } else {
        log("Error fetchEventsData: ${response.statusCode}");
        return null;
      }
    }catch(e){
      log("Error en Events Sync Network: $e");
      return null;
    }
  }
}
