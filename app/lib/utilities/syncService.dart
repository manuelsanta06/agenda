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

  static Future<void> performFullSync(AppDatabase db) async {
    print("Syncing...");

    if((await pushUnsyncedData(db)).$1){
      print("Push successfull, Pulling..");
      await fetchCatalogUpdates(db);
      await fetchEventsUpdates(db);
      print("Sincronización completa.");
    }else{
      print("Push failled.");
    }
  }

  static Future<(bool,String)> pushUnsyncedData(AppDatabase db)async{
    try{
      final payload=await db.getUnsyncedPayload();
      if(payload.values.every((list)=>(list as List).isEmpty))return (true,"successfull");
      log(jsonEncode(payload));
      print("paso");

      //request
      final uri=Uri.https(baseUrl,'/sync');
      final response=await http.post(
        uri,
        headers:_headers,
        body:jsonEncode(payload),
      );

      if(response.statusCode==200){
        await db.markAsSynced(payload);
        return (true,"successfull");
      }else{
        print("Error en POST /sync: ${response.statusCode}");
        return (false,"${response.statusCode}\n\n${response.body}");
      }
    }catch(e){
      print("Error de conexión: $e");
      return (false,"conection error");
    }
  }

  //catalog update
  static Future<void> fetchCatalogUpdates(AppDatabase db)async{
    if(!(await pushUnsyncedData(db)).$1)return;
    final now = DateTime.now().toUtc().toIso8601String();
    try{
      final prefs=await SharedPreferences.getInstance();
      final lastSyncStr=prefs.getString('last_sync_catalog')??'2000-01-01T00:00:00Z';

      final uri=Uri.https(baseUrl,'/sync/catalog',{
        'last_sync':lastSyncStr,
      });

      final response=await http.get(uri,headers:_headers);

      if(response.statusCode==200){
        final Map<String, dynamic> jsonData=jsonDecode(response.body);
        
        await db.processCatalogSync(jsonData);
        await prefs.setString('last_sync_catalog', now);
      } else {
        print("Error fetchCatalogUpdates: ${response.statusCode}");
      }
    }catch(e){
      print("Error en Catalog Sync: $e");
    }
  }

  //events update
  static Future<void> fetchEventsUpdates(AppDatabase db) async {
    if(!(await pushUnsyncedData(db)).$1)return;
    final now = DateTime.now().toUtc().toIso8601String();
    try{
      final prefs=await SharedPreferences.getInstance();
      final lastSyncStr=prefs.getString('last_sync_events')??'2000-01-01T00:00:00Z';

      final uri=Uri.https(baseUrl,'/sync/events',{
        'last_sync':lastSyncStr,
      });

      final response=await http.get(uri,headers:_headers);

      if(response.statusCode==200){
        final Map<String,dynamic> jsonData=jsonDecode(response.body);
        
        await db.processEventsSync(jsonData);
        
        //await db.deleteOldEvents();

        await prefs.setString('last_sync_events',now);
      }else{
        print("Error fetchEventsUpdates: ${response.statusCode}");
      }
    }catch(e){
      print("Error de red en Events Sync: $e");
    }
  }
}
