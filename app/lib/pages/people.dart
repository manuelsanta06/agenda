import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/material.dart';
import '../widgets/searchBar.dart';
import '../widgets/imageImput.dart';


class chofer{
  Image? picture;
  String name;
  String surename;
  String dni;
  String mobileNumber;
  Container? def;

  chofer({this.name="",this.surename="",required this.dni,this.mobileNumber="",this.picture}){
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
          (name.isNotEmpty?name[0]:"")+(surename.isNotEmpty?surename[0].toLowerCase():""),
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
                    name.split(" ").first+" "+surename.split(" ").first,
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

Future<chofer?> getChofer(BuildContext context,{String nameD="",String surNameD="",String dniD="",String mobileNumberD="",Image? pictureD}){
  final nameC = TextEditingController(text: nameD);
  final surNameC = TextEditingController(text: surNameD);
  final dniC = TextEditingController(text: dniD);
  final mobileNumberC = TextEditingController(text: mobileNumberD);

  return showModalBottomSheet<chofer>(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context){
      return StatefulBuilder(builder: (BuildContext context, StateSetter setState){return Container(child:AnimatedPadding(
        duration: const Duration(milliseconds: 150),
        padding: EdgeInsets.only(
          left: 15,right: 15,
          top: 15,bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Nombre completo"),
            Row(
              children: [
                Expanded(child:TextField(
                  decoration: InputDecoration(hintText: "Nombres/s"),
                  textCapitalization: TextCapitalization.words,
                  controller: nameC,
                ),),
                const SizedBox(width: 8),
                Expanded(child:TextField(
                  decoration: InputDecoration(hintText: "Apellido/s"),
                  textCapitalization: TextCapitalization.words,
                  controller: surNameC,
                ),),
              ],
            ),
            
            const SizedBox(height: 8),
            const Text("DNI"),
            TextField(
              decoration: InputDecoration(hintText: "12345678"),
              keyboardType: TextInputType.number,
              controller:dniC,
            ),
            
            const SizedBox(height: 8),
            const Text("Telefono"),
            TextField(
              decoration: InputDecoration(hintText: "1234567890"),
              keyboardType: TextInputType.phone,
              controller:mobileNumberC,
            ),
            
            const SizedBox(height: 8),
            const Text("Imagen"),
            GestureDetector(
              onTap: ()async{
                pictureD=await pickImage(context,[CropAspectRatioPreset.square]);
                setState((){});
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: pictureD==null?Color(0xFF94A3B8):Colors.greenAccent,
                    style: BorderStyle.solid, width: 2
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Clic para subir una foto",
                  style: TextStyle(color: Color(0xFF94A3B8)),
                ),
              ),
            ),

            const SizedBox(height: 15),
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

            const SizedBox(height: 5),
            SizedBox(
              width: double.infinity,
              child:ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: peoplePage.mainColor,
                  padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: (){
                  if(dniC.text.isNotEmpty){
                    Navigator.of(context).pop(chofer(
                        name: nameC.text,
                        surename: surNameC.text,
                        dni: dniC.text,
                        mobileNumber: mobileNumberC.text,
                        picture: pictureD,
                    ));
                  }
                },
                child: const Text(
                  "Guardar",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ));});
    }
  );
}

List<chofer> choferes=[                                                 
    chofer(name:"victor",dni:"12345678",mobileNumber:"1234567890"),
    chofer(name:"Gustavo",dni:"12345678",mobileNumber:"1234567890",picture: Image(image:NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'))),
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
    var filtered=[];
    if(searchQuery!=""){
      filtered = choferes.where((c) {
        return c.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
            c.dni.toLowerCase().contains(searchQuery.toLowerCase()) ||
            c.surename.toLowerCase().contains(searchQuery.toLowerCase()) ||
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
