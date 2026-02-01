import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/searchBar.dart';
import 'package:agenda/database/app_database.dart';
import 'package:agenda/utilities/recorridos.dart';
import 'package:drift/drift.dart' as drift;
import 'package:uuid/uuid.dart';
import 'recorridoInfo.dart';


class recorridosPage extends StatefulWidget {
  const recorridosPage({super.key});
  static const Color mainColor=Colors.green;

  @override
  State<recorridosPage> createState() => _recorridosPage();
}
class _recorridosPage extends State<recorridosPage>{
  String searchQuery = "";


  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabase>(context);
    final deafDb=Provider.of<AppDatabase>(context, listen: false);

    return Scaffold(
      body:SafeArea(child:Column(children:[
        mySearchBar(onChanged:(value){setState((){searchQuery = value;});}),
        Expanded(child:StreamBuilder<List<Recorrido>>(
          stream: db.select(db.recorridos).watch(),
          builder:(context, snapshot){
            if(snapshot.hasError){
              return Center(
                child: SingleChildScrollView(child:Text("""perdon, pasale captura a manu
                  Error: ${snapshot.error}
                  Stacktrace:
                  ${snapshot.stackTrace.toString()
                    .split('\n').take(6).join('\n')}""", 
                  style: TextStyle(color: Colors.red))
              ));
            }
            if(!snapshot.hasData)return const Center(child: CircularProgressIndicator());
            //return const Center(child: CircularProgressIndicator());
            final recorridos=snapshot.data!;
            recorridos.sort((a, b) {
              if(a.pinned&&!b.pinned)return -1;
              if(!a.pinned && b.pinned)return 1;
              return a.name.compareTo(b.name);
            });
            final activos=recorridos.where((r)=>r.isActive).toList();
            final inactivos=recorridos.where((r)=>!r.isActive).toList();

            return ListView( children:[
              ...activos.map((s)=>recorridoToCard(context,recorridosPage.mainColor,s,(){
                Navigator.of(context).push(MaterialPageRoute(
                  builder:(Context)=>recorridoInfo(reco:s,maincolor:recorridosPage.mainColor)
                ));
              })),

              if(inactivos.isNotEmpty)...[
                const SizedBox(height: 20),
                const Center( child: Text("Inactivos / Finalizados",
                  style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                )),
                const SizedBox(height: 10),
                
                ...inactivos.map((s)=>recorridoToCard(context,recorridosPage.mainColor,s,(){})),
              ],
            ]);
          }
        )),
      ])),
      floatingActionButton:FloatingActionButton(
        onPressed:()async{
          final newRecorrido=await showCreateRecorridoSheet(context,recorridosPage.mainColor);
          if(newRecorrido==null)return;
          await deafDb.into(deafDb.recorridos).insert(newRecorrido);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(backgroundColor:Colors.green,content: Text("Recorrido '${newRecorrido.name.value}' creado")),
          );
        },
        //()=>generateMockRecorridos(deafDb),
        backgroundColor: recorridosPage.mainColor,
        child:Icon(Icons.add),
      )
    );
  }
}
