import 'package:agenda/database/app_database.dart';
import 'package:image_cropper/image_cropper.dart';
import '../widgets/imageImput.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart' as drift; 
import 'dart:io';

typedef Chofer=Chofere;

Color rotateColor(Color ete,int rotation){
  return HSLColor.fromAHSL(1.0,(HSLColor.fromColor(ete).hue+rotation)%360,1.0,0.5).toColor();
  //final hsl=HSLColor.fromColor(ete);
  //return hsl.withHue((hsl.hue+rotation)%360).toColor();
}

Widget dataLine(String text, Color mainColor) {
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
            color: mainColor,
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

//TODO: usar "cachedNetworkImage" cuando haya servidor
Widget buildAvatar(Chofer chofe, Color mainColor){
  if(chofe.picturePath?.isNotEmpty??false){
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.file(
        File(chofe.picturePath!),
        //loadingBuilder:(BuildContext c){return const Center(child: CircularProgressIndicator())},
        height: 72,
      ),
    );
  }
  final letters;
  if(chofe.alias?.isNotEmpty??false)letters=chofe.alias![0];
  else letters=((chofe.name?.isNotEmpty??false)?chofe.name![0]:"")+
        ((chofe.surname?.isNotEmpty??false)?chofe.surname![0].toLowerCase():"");

  return Container(
    width: 72,
    height: 72,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      gradient: LinearGradient(
        colors: [mainColor,rotateColor(mainColor,60)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    alignment: Alignment.center,
    child: Text(
      letters,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    ),
  );
}

Widget choferToCard(BuildContext context,Chofer chofe, Color mainColor){
  return  Container(
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),

    child: Material(
      color: chofe.is_active?Colors.white12:Colors.red.withOpacity(0.1),
      borderRadius: BorderRadius.circular(14),
      clipBehavior: Clip.hardEdge,

      child:InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: (){return;},
        onLongPress: ()=>showDialog<void>(
          context: context,
          builder:(BuildContext context){
            return AlertDialog(
              title: const Text("Eliminar hofer?"),
              content:Text("¿Seguro que queres eliminar '${chofe.alias?.isNotEmpty??false?chofe.alias:chofe.name}'?"),
              actions: [
                TextButton(
                  child: const Text("Cancelar"),
                  onPressed:()=> Navigator.pop(context),
                ),
                TextButton(
                  child: const Text("Eliminar", style: TextStyle(color: Colors.red)),
                  onPressed:()async{
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:Text("Eliminado")));
                    final db=Provider.of<AppDatabase>(context, listen: false);
                    await (db.update(db.choferes)
                      ..where((tbl)=>tbl.id.equals(chofe.id)))
                      .write(ChoferesCompanion(
                        is_active: drift.Value(false)
                      ));
                  },
                ),
              ],
            );
          },
        ),
        child: Padding(padding:const EdgeInsets.all(14),child:Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildAvatar(chofe, mainColor),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Text(
                    (chofe.alias?.isNotEmpty??false)?
                      chofe.alias!
                      :'${chofe.name?.split(" ").first??""} ${chofe.surname?.split(" ").first??""}',
                    style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600,),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      dataLine("DNI: ${chofe.dni}",mainColor),
                      dataLine("Tel: ${chofe.mobileNumber}",mainColor),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    ),
  );
}
Future<ChoferesCompanion?> getChofer(BuildContext context, Color mainColor,Chofer? chofe){
  final nameC = TextEditingController(text: chofe?.name??"");
  final surNameC = TextEditingController(text: chofe?.surname??"");
  final aliasC = TextEditingController(text: chofe?.alias??"");
  final dniC = TextEditingController(text: chofe?.dni??"");
  final mobileNumberC = TextEditingController(text: chofe?.mobileNumber??"");
  String pictureD = chofe?.picturePath??"";

  return showModalBottomSheet<ChoferesCompanion>(
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
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children:[
                Expanded(child:TextFormField(
                  controller:aliasC,
                  decoration:const InputDecoration(
                    labelText:"Apodo",
                    fillColor:Colors.transparent,
                    border:UnderlineInputBorder(),
                  ),
                )),
                ElevatedButton(
                  onPressed: (){
                    if(nameC.text.isEmpty&&surNameC.text.isEmpty&&aliasC.text.isEmpty)return;
                    Navigator.of(context).pop(ChoferesCompanion(
                        id: drift.Value(chofe?.id?? Uuid().v4()),
                        name: drift.Value(nameC.text),
                        surname: drift.Value(surNameC.text),
                        alias: drift.Value(aliasC.text),
                        dni: drift.Value(dniC.text),
                        mobileNumber: drift.Value(mobileNumberC.text),
                        picturePath: drift.Value(pictureD),
                    ));
                  },
                  style:ElevatedButton.styleFrom(
                    backgroundColor:mainColor,
                    foregroundColor:Colors.white,
                  ),
                  child:const Text("Guardar"),
                ),
              ],
            ),
            const SizedBox(height: 8),
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
                final tmp=await saveImageLocally(await pickImage(context,[CropAspectRatioPreset.square]));
                if(tmp==null)return;
                pictureD=tmp;
                setState((){});
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: pictureD.isEmpty?Color(0xFF94A3B8):Colors.green,
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

            const SizedBox(height: 20),
          ],
        ),
      ));});
    }
  );
}
