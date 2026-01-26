import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../database/app_database.dart';
import '../utilities/people.dart';
import '../widgets/searchBar.dart';

typedef Chofer=Chofere;


class peoplePage extends StatefulWidget {
  const peoplePage({super.key});
  static const Color mainColor=Colors.purple;

  @override
  State<peoplePage> createState() => _peoplePageState();
}

class _peoplePageState extends State<peoplePage>{
  String searchQuery = "";
  bool showInactives=false;

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabase>(context);

    return Scaffold(
      body:SafeArea(child: Column(
        children: [
          mySearchBar(onChanged:(value){setState((){searchQuery = value;});}),

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
                activeTrackColor:peoplePage.mainColor,
                onChanged:(bool value){
                  setState((){showInactives=value;});
                }
              )
            ])
          ),

          Expanded(
            child: StreamBuilder<List<Chofere>>(
              stream: db.select(db.choferes).watch(), 
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

                final listaChoferes = snapshot.data!.where((tbl) => tbl.is_active||showInactives).toList();

                // Aplicar filtro de búsqueda
                final filtered = searchQuery.isEmpty
                  ? listaChoferes
                  : listaChoferes.where((c){
                    return (c.name?.toLowerCase().contains(searchQuery.toLowerCase())??false) ||
                      (c.dni?.toLowerCase().contains(searchQuery.toLowerCase())??false) ||
                      (c.surname?.toLowerCase().contains(searchQuery.toLowerCase())??false) ||
                      (c.mobileNumber?.toString().contains(searchQuery)??false);
                  }).toList();
                if(filtered.isEmpty)return const Center(child:Text("???"));

                return ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder:(context, index){
                    return choferToCard(
                      context,filtered[index],peoplePage.mainColor,
                      onPressed: ()=>{},
                      onLongPress: (filtered[index].is_active)?
                        ()=>removeChoferDialog(context,filtered[index],false):
                        ()=>removeChoferDialog(context,filtered[index],true)
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),),
      floatingActionButton: FloatingActionButton(
        onPressed:() async {
          final nuevo = await getChofer(context, peoplePage.mainColor, null);
          if(nuevo == null)return;
          await db.into(db.choferes).insert(nuevo);
      
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:const Text('chofer guardado'),
            backgroundColor:Colors.green,
          ));
        },
        backgroundColor: peoplePage.mainColor,
        child:Icon(Icons.add),
      ),
    );
  }
}
