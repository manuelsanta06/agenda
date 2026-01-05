import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart' as drift; 
import '../widgets/searchBar.dart';
import '../utilities/colectivos.dart';
import '../database/app_database.dart';



/*
  void _editMenu(BuildContext context)async {
    final nuevo = await showAddColectivoSheet(context,
      nameD:name,plateD:plate,internD:number.toString());
    copyFrom(nuevo);
  }
*/
class colectivosPage extends StatefulWidget {
  const colectivosPage({super.key});
  static const Color mainColor=Color.fromARGB(255, 252, 102, 1);

  @override
  State<colectivosPage> createState()=> _colectivosPageState();
}

class _colectivosPageState extends State<colectivosPage>{
  String searchQuery = "";

  @override
  Widget build(BuildContext context){
    
    final db = Provider.of<AppDatabase>(context);

    return Scaffold(
      body:SafeArea(child: Column(
          children: [
            mySearchBar(onChanged:(value){setState((){searchQuery = value;});},),
            Expanded(
              child: StreamBuilder<List<Colectivo>>(
                stream: db.select(db.colectivos).watch(), 
                builder:(context, snapshot){
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error: ${snapshot.error}\nperdon, pasale captura a manu", 
                      style: TextStyle(color: Colors.red))
                    );
                  }
                  if(!snapshot.hasData)return const Center(child: CircularProgressIndicator());

                  final listaColectivos = snapshot.data!.where((tbl) => tbl.is_active).toList();

                  // Aplicar filtro de búsqueda
                  final filtered = searchQuery.isEmpty
                    ? listaColectivos 
                    : listaColectivos.where((c){
                      return(c.name?.toLowerCase().contains(searchQuery.toLowerCase())?? false) ||
                        c.plate.toLowerCase().contains(searchQuery.toLowerCase())||
                       (c.number?.toString().contains(searchQuery)?? false);
                        }).toList();
                  if(filtered.isEmpty)return const Center(child:Text("???"));

                  return ListView.builder(
                    itemCount: filtered.length,
                    itemBuilder:(context, index){
                      return colectivoToCard(context, filtered[index],colectivosPage.mainColor);
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
      
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Colectivo guardado')),
          );
        },
        backgroundColor: colectivosPage.mainColor,
        child:Icon(Icons.add),
      ),
    );
  }
}
