import 'package:agenda/widgets/cards.dart';
import 'package:flutter/material.dart';
import 'package:agenda/database/app_database.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as drift;
import 'package:uuid/uuid.dart';
import '../utilities/parsers.dart';

Widget encargadoToCard(BuildContext context,
  Color mainColor,
  Encargado enca,
  List<RecorridoSubscription> subs,
  VoidCallback? onPressed
){
  return BasicCard(
    margin:const EdgeInsets.symmetric(vertical:10,horizontal:8),
    onPressed:onPressed,
    child:Column(crossAxisAlignment: CrossAxisAlignment.start,children:[
      Row(children:[
        Expanded(child:Text(enca.name)),
        Text(numberParser(enca.balance.toInt()),style:TextStyle(color:enca.balance>=0?mainColor:Colors.red)),
      ]),
      Text(
        subs.map((s){return s.subscriptionName;}).join('\n'),
        style:TextStyle(color:Colors.grey,fontSize:12),
      ),
    ])
  );
}

class TempSubscription{
  String? originalId;
  TextEditingController nameC=TextEditingController();
  TextEditingController addressC=TextEditingController();
  TextEditingController priceC=TextEditingController();
  TempSubscription({this.originalId});
}

Future<bool?> showCreateModifiEncargadoSheet(
  BuildContext context,
  Color mainColor,
  String recoId,
  String? def,{
  Encargado? encargadoEdit,
  List<RecorridoSubscription>? subsEdit,
}){
  return showModalBottomSheet<bool>(
    context:context,
    isScrollControlled:true,
    useSafeArea: true,
    builder:(context)=>_EncargadoForm(
      mainColor:mainColor,
      recoId:recoId,
      def:def,
      encargadoEdit: encargadoEdit,
      subsEdit: subsEdit,
    ),
  );
}

class _EncargadoForm extends StatefulWidget {
  final Color mainColor;
  final String? def;
  final Encargado? encargadoEdit;
  final List<RecorridoSubscription>? subsEdit;
  final String recoId;
  const _EncargadoForm({
    required this.mainColor,
    this.def,
    this.encargadoEdit,
    this.subsEdit,
    required this.recoId,
  });

  @override
  State<_EncargadoForm> createState() => _CreateRecorridoFormState();
}

class _CreateRecorridoFormState extends State<_EncargadoForm>{
  final TextEditingController nameC=TextEditingController();
  final TextEditingController phoneC=TextEditingController();
  late List<TempSubscription> children;
  late List<TempSubscription> toDelete=[];
  final _formKey=GlobalKey<FormState>();
  
  @override
  void initState() {
    super.initState();
    if(widget.encargadoEdit!=null){
      nameC.text = widget.encargadoEdit?.name ?? "";
      phoneC.text = widget.encargadoEdit?.phone ?? "";
      if(widget.subsEdit!=null&&widget.subsEdit!.isNotEmpty){
        children = widget.subsEdit!.map((sub) {
          final temp = TempSubscription(originalId: sub.id);
          temp.nameC.text = sub.subscriptionName??"";
          temp.addressC.text = sub.address??"";
          temp.priceC.text = sub.customPrice?.toString() ?? "";
          return temp;
        }).toList();
      }else{
        children=[TempSubscription()];
      }
    }else{
      children=[TempSubscription()];
      if(widget.def==null||widget.def!.isEmpty)return;
      if((int.tryParse(widget.def!))==null)nameC.text=widget.def!;
      else phoneC.text=phoneParser(widget.def!);
    }
  }

  void _returnSubscription(){
    if(toDelete.isNotEmpty){
      setState((){children.add(toDelete.removeLast());});
      return;
    }
    _addSubscription();
  }
  void _addSubscription(){
    setState((){children.add(TempSubscription());});
  }
  void _removeSubscription(int index){
    if(children[index].originalId!=null)toDelete.add(children[index]);
    setState((){children.removeAt(index);});
    return;
  }

  void _onSave(BuildContext context)async{
    if(!(_formKey.currentState?.validate()??false))return;
    final db = Provider.of<AppDatabase>(context, listen: false);
    await db.transaction(()async{
      String encargadoId;
      if(widget.encargadoEdit != null){
        encargadoId=widget.encargadoEdit!.id;
        await (db.update(db.encargados)..where((s)=>db.encargados.id.equals(encargadoId)))
          .write(EncargadosCompanion(
            id:drift.Value(encargadoId),
            name: drift.Value(nameC.text),
            phone: drift.Value(phoneC.text),
            isSynced:drift.Value(false),
          ));
      }
      else{
        encargadoId=const Uuid().v4();
        await (db.into(db.encargados).insert(EncargadosCompanion(
          id:drift.Value(encargadoId),
          name: drift.Value(nameC.text),
          phone: drift.Value(phoneParser(phoneC.text)),
          isSynced:drift.Value(false),
        )));
      }
      for(final temp in children){
        final companion=RecorridoSubscriptionsCompanion(
          id:drift.Value(const Uuid().v4()),
          subscriptionName:drift.Value(temp.nameC.text),
          address:drift.Value(temp.addressC.text),
          customPrice:drift.Value(int.tryParse(temp.priceC.text)),
          recorridoId:drift.Value(widget.recoId),
          encargadoId:drift.Value(encargadoId),
        );
        if (temp.originalId == null) {
          await db.into(db.recorridoSubscriptions).insert(companion);
        } else {
          await (db.update(db.recorridoSubscriptions)
            ..where((t) => t.id.equals(temp.originalId!)))
            .write(companion);
        }
      }
    });
    Navigator.pop(context,true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Form(key:_formKey,child:Column(
        children: [
          
          //HEADER
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context,false),
                ),
                const Expanded(
                  child: Text(
                    "Nuevo Encargado",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 48), 
              ],
            ),
          ),

          //CONTENIDO
          Expanded(child:ListView(
            padding: const EdgeInsets.all(24),
            children:[
              _buildSectionTitle("Datos del Responsable"),
              
              // Inputs del Encargado
              _buildTextField(label:"Nombre",icon:Icons.person,controller:nameC,needed:true),
              const SizedBox(height: 16),
              _buildTextField(label:"Teléfono (Opcional)",icon:Icons.phone,controller:phoneC),

              const SizedBox(height: 30),
              const Divider(),
              const Center(child:Chip(label:Text("Pasajeros"))),
              const SizedBox(height: 20),

              ...List.generate(children.length,(index){return _buildStudentCard(index);}),

              const SizedBox(height: 20),
              
              // Boton Agregar otra subscripcion
              Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children:[
                Expanded(child:OutlinedButton.icon(
                  onPressed:()=>_addSubscription(),
                  icon: const Icon(Icons.add),
                  label: const Text("Agregar"),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                )),
                if(toDelete.isNotEmpty)
                Expanded(child:OutlinedButton.icon(
                  onPressed:()=>_returnSubscription(),
                  icon: const Icon(Icons.restore_from_trash),
                  label: const Text("Restaurar"),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ))
              ]),
              const SizedBox(height:200),
            ],
          ),),

          //GUARDAR
          Container(
            padding:const EdgeInsets.all(16),
            decoration: BoxDecoration(color:Theme.of(context).cardColor),
            child:SafeArea(
              child:ElevatedButton(
                onPressed:()=>_onSave(context),
                style:ElevatedButton.styleFrom(
                  backgroundColor:widget.mainColor,
                  foregroundColor: Colors.white,
                  minimumSize:const Size(double.infinity,50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child:const Text("GUARDAR TODO",style:TextStyle(fontSize:16,fontWeight:FontWeight.bold)),
              ),
            ),
          ),
        ],
      )),
    );
  }

  Widget _buildStudentCard(int index) {
    final sub = children[index];
    return BasicCard(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      borderColor:Colors.grey.shade300,
      actionIcon:children.length<=1?null:const Icon(Icons.delete,color:Colors.red),
      actionPosition: Alignment(0.9,-0.9),
      onActionPressed:()=>_removeSubscription(index),
      child: Column(
        children: [
          Text("Pasajero #${index + 1}",style:const TextStyle(fontWeight:FontWeight.bold,color:Colors.grey)),
          const SizedBox(height:8),
          _buildTextField(label:"Nombre del Alumno",icon:Icons.school,controller:sub.nameC,needed:true),
          const SizedBox(height:12),
          _buildTextField(label:"Dirección",icon:Icons.location_on,controller:sub.addressC),
          const SizedBox(height:12),
          _buildTextField(label:"Precio (Opcional)",icon:Icons.attach_money,controller:sub.priceC,isNumber:true),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding:const EdgeInsets.only(bottom:12),
      child:Text(title,style:TextStyle(color:widget.mainColor,fontWeight:FontWeight.bold,letterSpacing:1)),
    );
  }
  Widget _buildTextField({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    bool needed=false,
    bool isNumber = false,
  }){
    return TextFormField(
      controller: controller,
      keyboardType:isNumber?const TextInputType.numberWithOptions(decimal:true):TextInputType.text,
      //key:_formKey,
      validator:(value){return ((needed&&(value?.isEmpty??false))?"Obligatorio":null);},
      decoration: InputDecoration(
        labelText: label,
        prefixIcon:Icon(icon),
        border:OutlineInputBorder(borderRadius:BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.05),
        focusedBorder: OutlineInputBorder(
          borderRadius:BorderRadius.circular(12),
          borderSide:BorderSide(color:widget.mainColor,width:2),
        ),
      ),
    );
  }
}
