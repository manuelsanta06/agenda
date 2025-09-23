import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/searchBar.dart';

class chofer{
  Image? picture;
  String name;
  String dni;
  String mobileNumber;
  Container? def;
  chofer({required this.name,this.dni="",this.mobileNumber="",this.picture}){
    if(picture==null){
      def=Container(
        width: 72,
        height: 72,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            colors: [peoplePage.mainColor,Colors.pink],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          name.isNotEmpty ? name[0].toUpperCase() : "?",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      );
    }
  }

  Widget avatarWidget() {
    if (picture != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(width: 72, height: 72, child: picture),
      );
    }else
        return def!;
  }

  Widget toWidget(BuildContext context, VoidCallback onChanged, VoidCallback onRemove){
    return GestureDetector(
      onTap: null,
      onLongPress: null,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            avatarWidget(),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600,),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _metaLine("DNI: $dni"),
                      _metaLine("Tel: $mobileNumber"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _metaLine(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: peoplePage.mainColor,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
            ),
          ),
        ],
      ),
    );
  }
}

Future<chofer?> getChofer(BuildContext context,{String nameD="",String dniD="",String mobileNumberD=""}){
  final nameC = TextEditingController(text: nameD);
  final dniC = TextEditingController(text: dniD);
  final mobileNumberC = TextEditingController(text: mobileNumberD);

  return showModalBottomSheet<chofer>(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context){
      return AnimatedPadding(
        duration: const Duration(milliseconds: 150),
        padding: EdgeInsets.only(
          left: 15,right: 15,
          top: 15,bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Nombre completo"),
            TextField(
              textCapitalization: TextCapitalization.words,
              controller: nameC,
            ),
            
            const SizedBox(height: 8),
            const Text("DNI"),
            TextField(
              keyboardType: TextInputType.number,
              controller:dniC,
            ),
            
            const SizedBox(height: 8),
            const Text("Telefono"),
            TextField(
              keyboardType: TextInputType.phone,
              controller:mobileNumberC,
            ),
            
            const SizedBox(height: 8),
            const Text("Imagen"),
            GestureDetector(
              onTap: (){},
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF94A3B8), style: BorderStyle.solid, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Clic para subir una foto",
                  style: TextStyle(color: Color(0xFF94A3B8)),
                ),
              ),
            ),

            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child:OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF94A3B8),
                  side: const BorderSide(color: Color(0xFF334155)),
                  padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: (){},
                child: const Text(
                  "Importar desde Contactos",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
            ),

            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child:ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: peoplePage.mainColor,
                  padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: (){},
                child: const Text(
                  "Guardar",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
    }
  );
}

List<chofer> choferes=[                                                 
    chofer(name:"victor",dni:"12345678",mobileNumber:"1234567890"),
    chofer(name:"Gustavo",dni:"12345678",mobileNumber:"1234567890"),
    chofer(name:"Esteban",dni:"12345678",mobileNumber:"1234567890"),
    chofer(name:"Luis",dni:"12345678",mobileNumber:"1234567890"),
    chofer(name:"Lucas",dni:"12345678",mobileNumber:"1234567890"),
];

class peoplePage extends StatefulWidget {
  const peoplePage({super.key});
  static const Color mainColor=Colors.purple;

  @override
  State<peoplePage> createState() => _peoplePageState();
}

class _peoplePageState extends State<peoplePage>{
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    //filtering the busses
    final filtered;
    if(searchQuery!=""){
      filtered = choferes.where((c) {
        return c.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
            c.dni.toLowerCase().contains(searchQuery.toLowerCase()) ||
            c.mobileNumber.toString().contains(searchQuery);
      }).toList();
    }
    else{filtered=choferes;}

    return Scaffold(
      body:SafeArea(child: Column(
          children: [
            mySearchBar(onChanged: (value){setState((){searchQuery = value;});},),
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: filtered[index].toWidget(context,
                      (){setState((){});},
                      (){setState((){choferes.remove(filtered[index]);});},),
                  );
                },
              ),
            ),
          ],
      ),),
      floatingActionButton: FloatingActionButton(
        onPressed:() async {
          final nuevo = await getChofer(context);
          if (nuevo != null)setState(() {choferes.add(nuevo);});
        },
        backgroundColor: peoplePage.mainColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child:Icon(Icons.add),
      ),
    );
  }
}
