import 'package:flutter/material.dart';

class ManuErrorWidget extends StatelessWidget{
  final AsyncSnapshot snapshot;
  
  const ManuErrorWidget({super.key,required this.snapshot});

  @override
  Widget build(BuildContext context){
    return Center(
      child: SingleChildScrollView(
        child: Text(
          """Perdón, pasale captura a manu
Error: ${snapshot.error}
Stacktrace:
${snapshot.stackTrace?.toString().split('\n').take(6).join('\n') ?? 'Sin detalles de pila'}""", 
          style: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
