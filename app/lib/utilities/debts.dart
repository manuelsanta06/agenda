import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as drift;
import 'package:intl/intl.dart';

import 'package:agenda/database/app_database.dart';

import 'package:agenda/utilities/syncService.dart';

import 'package:agenda/widgets/cards.dart';
import 'package:agenda/widgets/text.dart';
import 'package:agenda/widgets/timeinputs.dart';

Future<bool> showDebtDetails(BuildContext context,Debt debt,Color mainColor)async{
  final result=await showModalBottomSheet<DebtsCompanion>(
    context:context,
    isScrollControlled:true,
    builder:(context)=>_DebtDetailsSheet(debt:debt,mainColor:mainColor),
  );

  if(result==null)return false;
  final db=Provider.of<AppDatabase>(context,listen:false);

  try{
    await db.into(db.debts).insertOnConflictUpdate(
      result,
    );
     SyncService.pushUnsyncedData(db);
    return true;
  }catch(e){
    log("Error updating debt: $e");
    return false;
  }
}

class _DebtDetailsSheet extends StatefulWidget{
  final Debt debt;
  final Color mainColor;
  const _DebtDetailsSheet({required this.debt,required this.mainColor});

  @override
  State<_DebtDetailsSheet> createState()=>_DebtDetailsSheetState();
}

class _DebtDetailsSheetState extends State<_DebtDetailsSheet>{
  late int _total;
  late int _paid;
  late String _desc;
  late bool _settled;

  @override
  void initState(){
    super.initState();
    _total=widget.debt.totalAmount;
    _paid=widget.debt.paidAmount;
    _desc=widget.debt.description??"";
    _settled=widget.debt.isSettled;
  }

  @override
  Widget build(BuildContext context){
    return SafeArea(child:Padding(
      padding:const EdgeInsets.all(20),
      child:Column(
        mainAxisSize:MainAxisSize.min,
        crossAxisAlignment:CrossAxisAlignment.stretch,
        children:[
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children:[
              Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children:[
                  Text("Detalles de Deuda",style:TextStyle(fontSize:18,fontWeight:FontWeight.bold,color:widget.mainColor)),
                  Text(DateFormat('dd/MM/yyyy').format(widget.debt.date),style:const TextStyle(color:Colors.grey)),
                ],
              ),
            ],
          ),
          const SizedBox(height:20),

          pillProgress(
            mainColor:widget.mainColor,
            value:(_total>0)?(_paid/_total):0.0,
            text:"Deuda: \$${_total-_paid}",
          ),
          const SizedBox(height:20),

          subtitleLine("Descripción",widget.mainColor),
          BasicCard(
            onPressed:()async{
              String? val=await quickChangeDialog(context,"Descripción",def:_desc,multiLine:true);
              if(val!=null)setState(()=>_desc=val);
            },
            child:SizedBox(
              width:double.infinity,
              child:Text(_desc.isEmpty?"Sin descripción":_desc,
              style:TextStyle(color:_desc.isEmpty?Colors.grey:null)),
            )
          ),
          const SizedBox(height:15),

          // Amounts Section
          Row(children:[
            Expanded(child:BasicCard(
              onPressed:()async{
                String? val=await quickChangeDialog(context,"Monto Total",def:_total.toString());
                if(val!=null)setState(()=>_total=int.tryParse(val)??_total);
              },
              child:Column(children:[
                const Text("Total",style:TextStyle(fontSize:12,color:Colors.grey)),
                Text("\$$_total",style:const TextStyle(fontSize:18,fontWeight:FontWeight.bold)),
              ]),
            )),
            const SizedBox(width:10),
            Expanded(child:BasicCard(
              onPressed:()async{
                String? val=await quickChangeDialog(context,"Monto Pagado",def:_paid.toString());
                if(val!=null){setState((){
                  _paid=int.tryParse(val)??_paid;
                  if(_paid>=_total)_settled=true;
                });
              }},
              child:Column(children:[
                const Text("Pagado",style:TextStyle(fontSize:12,color:Colors.grey)),
                Text("\$$_paid",style:const TextStyle(fontSize:18,fontWeight:FontWeight.bold,color:Colors.green)),
              ]),
            )),
          ]),
          const SizedBox(height:15),

          // Settled Switch
          BasicCard(
            child:Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children:[
                const Text("¿Deuda saldada?",style:TextStyle(fontWeight:FontWeight.bold)),
                Switch(
                  value:_settled,
                  activeThumbColor:widget.mainColor,
                  onChanged:(v)=>setState(()=>_settled=v),
                ),
              ],
            ),
          ),
          const SizedBox(height:15),
          ElevatedButton(
            onPressed:()=>Navigator.pop(context,DebtsCompanion(
              id:drift.Value(widget.debt.id),
              passengerId:drift.Value(widget.debt.passengerId),
              choferId:drift.Value(widget.debt.choferId),
              date:drift.Value(widget.debt.date),
              description:drift.Value(_desc),
              totalAmount:drift.Value(_total),
              paidAmount:drift.Value(_paid),
              isSettled:drift.Value(_settled),
              isSynced:const drift.Value(false),
            )),
            style:ElevatedButton.styleFrom(
              backgroundColor:widget.mainColor,
              foregroundColor:Colors.white,
              padding: const EdgeInsets.symmetric(vertical:16),
              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(12)),
            ),
            child:const Text("Guardar"),
          ),
        ],
      ),
    ));
  }
}


Future<bool> showCreateDebtSheet(
  BuildContext context,
  Color mainColor,{
  String? passengerId,
  String? choferId
})async{
  assert((passengerId==null)!=(choferId==null));
  final result=await showModalBottomSheet<DebtsCompanion>(
    context:context,
    isScrollControlled:true,
    builder:(context)=>_CreateDebtSheet(mainColor:mainColor,passengerId:passengerId,choferId:choferId),
  );

  if(result==null)return false;
  final db=Provider.of<AppDatabase>(context,listen:false);

  try{
    await db.into(db.debts).insertOnConflictUpdate(result);
    //SyncService.pushUnsyncedData(db);
    return true;
  }catch(e){
    log("Error creating debt: $e");
    return false;
  }
}

class _CreateDebtSheet extends StatefulWidget{
  final Color mainColor;
  final String? passengerId;
  final String? choferId;
  const _CreateDebtSheet({required this.mainColor,this.passengerId,this.choferId});

  @override
  State<_CreateDebtSheet> createState()=>_CreateDebtSheetState();
}

class _CreateDebtSheetState extends State<_CreateDebtSheet>{
  final _formKey=GlobalKey<FormState>();
  late final TextEditingController _amountC;
  late final TextEditingController _descC;

  late bool _isPassenger;
  String? _selectedOwnerId;
  DateTime _date=DateTime.now();

  @override
  void initState(){
    super.initState();
    _amountC=TextEditingController();
    _descC=TextEditingController();

    _isPassenger=widget.choferId==null;
    _selectedOwnerId=widget.passengerId??widget.choferId;
  }

  @override
  void dispose(){
    _amountC.dispose();
    _descC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    final db=Provider.of<AppDatabase>(context,listen:false);
    final bool isLocked=widget.passengerId!=null||widget.choferId!=null;

    return SafeArea(child:Padding(
      padding:EdgeInsets.only(
        left:20,right:20,top:20,
        bottom:MediaQuery.of(context).viewInsets.bottom+20,
      ),
      child:Form(
        key:_formKey,
        child:Column(
          mainAxisSize:MainAxisSize.min,
          crossAxisAlignment:CrossAxisAlignment.stretch,
          children:[
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children:[
                Text("Nueva Deuda",style:TextStyle(fontSize:20,fontWeight:FontWeight.bold,color:widget.mainColor)),
              ],
            ),
            const SizedBox(height:20),

            // Entity Selector (Only shows if triggered globally without IDs)
            if(!isLocked)...[
              Row(children:[
                Expanded(child:RadioListTile<bool>(
                  title:const Text("Pasajero"),
                  value:true,
                  groupValue:_isPassenger,
                  activeColor:widget.mainColor,
                  onChanged:(v)=>setState((){_isPassenger=v!;_selectedOwnerId=null;}),
                )),
                Expanded(child:RadioListTile<bool>(
                  title:const Text("Chofer"),
                  value:false,
                  groupValue:_isPassenger,
                  activeColor:widget.mainColor,
                  onChanged:(v)=>setState((){_isPassenger=v!;_selectedOwnerId=null;}),
                )),
              ]),
              FutureBuilder(
                future:_isPassenger?db.select(db.passengers).get():db.select(db.choferes).get(),
                builder:(context,snapshot){
                  if(!snapshot.hasData)return const LinearProgressIndicator();
                  final items=snapshot.data as List<dynamic>; // dynamic to handle both table types easily
                  return DropdownButtonFormField<String>(
                    value:_selectedOwnerId,
                    decoration:InputDecoration(labelText:_isPassenger?"Seleccionar Pasajero":"Seleccionar Chofer",prefixIcon:const Icon(Icons.person)),
                    items:items.map((item)=>DropdownMenuItem<String>(value:item.id,child:Text(item.name))).toList(),
                    onChanged:(val)=>setState(()=>_selectedOwnerId=val),
                    validator:(v)=>v==null?"Requerido":null,
                  );
                },
              ),
              const SizedBox(height:15),
            ],

            // Amount Input
            TextFormField(
              controller:_amountC,
              keyboardType:TextInputType.number,
              decoration:const InputDecoration(labelText:"Monto Total (\$)",prefixIcon:Icon(Icons.attach_money)),
              validator:(v)=>v==null||v.isEmpty||int.tryParse(v)==null?"Ingresa un monto válido":null,
            ),
            const SizedBox(height:15),

            // Description Input
            TextFormField(
              controller:_descC,
              textCapitalization:TextCapitalization.sentences,
              decoration:const InputDecoration(labelText:"Descripción (Opcional)",prefixIcon:Icon(Icons.notes)),
            ),
            const SizedBox(height:15),

            // Date Picker Card
            BasicCard(
              tonality: widget.mainColor,
              onPressed:()async{
                final picked=await getDate(context,_date);
                if(picked!=null)setState(()=>_date=picked);
              },
              child:Row(
                children:[
                  Row(children:[
                    Icon(Icons.calendar_month,color:widget.mainColor),
                    const SizedBox(width:10),
                  ]),
                  Text(DateFormat('dd/MM/yyyy').format(_date),style:TextStyle(color:widget.mainColor,fontWeight:FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height:15),
            ElevatedButton(
              onPressed:(){
                if(_formKey.currentState!.validate()&&_selectedOwnerId!=null){
                  final amount=int.parse(_amountC.text);
                  final companion=DebtsCompanion(
                    id:drift.Value(const Uuid().v4()),
                    passengerId:drift.Value(_isPassenger?_selectedOwnerId:null),
                    choferId:drift.Value(!_isPassenger?_selectedOwnerId:null),
                    date:drift.Value(_date),
                    description:drift.Value(_descC.text.isEmpty?null:_descC.text),
                    totalAmount:drift.Value(amount),
                    paidAmount:const drift.Value(0),
                    isSettled:const drift.Value(false),
                    isSynced:const drift.Value(false),
                  );
                  Navigator.pop(context,companion);
                }else if(_selectedOwnerId==null){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text("Selecciona un deudor"),backgroundColor:Colors.red));
                }
              },
              style:ElevatedButton.styleFrom(
                backgroundColor:widget.mainColor,
                foregroundColor:Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(12)),

              ),
              child:const Text("Crear"),
            ),
          ],
        ),
      ),
    ));
  }
}
