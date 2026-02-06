import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/searchBar.dart';
import '../utilities/colectivos.dart';
import '../database/app_database.dart';


class colectivosPage extends StatefulWidget {
  const colectivosPage({super.key});
  static const Color mainColor=Color.fromARGB(255, 252, 102, 1);

  @override
  State<colectivosPage> createState()=> _colectivosPageState();
}

class _colectivosPageState extends State<colectivosPage>{
  String searchQuery = "";
  bool showInactives=false;

  @override
  Widget build(BuildContext context){
    
    final db = Provider.of<AppDatabase>(context);

    return Scaffold(
      body:SafeArea(child: Column(
          children: [
            mySearchBar(onChanged:(value){setState((){searchQuery = value;});},),

            Container(
              margin:const EdgeInsets.symmetric(horizontal: 10),
              child:Row(children: [
                Expanded(child: Text(
                  "Mostrar inactivos",
                  style:TextStyle(fontSize:16, fontWeight:showInactives?FontWeight.bold:FontWeight.normal),
                )),
                Switch(
                  value: showInactives,
                  activeThumbColor: Colors.white,
                  activeTrackColor:colectivosPage.mainColor,
                  onChanged:(bool value){
                    setState((){showInactives=value;});
                  }
                )
              ])
            ),

            Expanded(
              child: StreamBuilder<List<Colectivo>>(
                stream: db.select(db.colectivos).watch(), 
                builder:(context, snapshot){
                  if(snapshot.hasError){
                    return Center(
                      child: Text("Error: ${snapshot.error}\nperdon, pasale captura a manu", 
                      style: TextStyle(color: Colors.red))
                    );
                  }
                  if(!snapshot.hasData)return const Center(child: CircularProgressIndicator());

                  final listaColectivos=snapshot.data!.where((tbl)=>showInactives?!tbl.is_active:tbl.is_active).toList();

                  // Aplicar filtro de búsqueda
                  final filtered = searchQuery.isEmpty
                    ? listaColectivos
                    : listaColectivos.where((c){
                      return(c.name?.toLowerCase().contains(searchQuery.toLowerCase())?? false) ||
                        c.plate.toLowerCase().contains(searchQuery.toLowerCase())||
                       (c.number?.toString().contains(searchQuery)?? false);
                        }).toList();
                  if(filtered.isEmpty)return const Center(child:Text("???"));
                  filtered.sort((a,b)=>a.number?.compareTo(b.number??999)??1);

                  return ListView.builder(
                    itemCount: filtered.length,
                    itemBuilder:(context, index){
                      return colectivoToCard(
                        context,filtered[index],colectivosPage.mainColor,
                        onPressed:null,
                        onLongPress:null,
                      );
                    },
                  );
                },
              ),
            ),
          ],
      ),),
      floatingActionButton: FloatingActionButton(
        onPressed:()async {
          final nuevo = await showAddColectivoSheet(context);
          if(nuevo == null)return;
          await db.into(db.colectivos).insert(nuevo);
      
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('Colectivo guardado'),
            backgroundColor:Colors.green,
          ));
        },
        backgroundColor: colectivosPage.mainColor,
        child:Icon(Icons.add),
      ),
    );
  }
}
