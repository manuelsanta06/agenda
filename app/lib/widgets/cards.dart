import 'package:flutter/material.dart';

Future<String?> quickChangeDialog(BuildContext context, String title,{String def=""})async{
  final controller = TextEditingController(text: def);
  return await showDialog<String?>(
    context: context,
    builder: (BuildContext context){
      return AlertDialog(
        title: Text("Cambiar $title"),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText:title,),
        ),
        actions:[
          TextButton(
            child: const Text("Cancelar"),
            onPressed:(){Navigator.of(context).pop();},
          ),
          TextButton(
            child: const Text("Guardar"),
            onPressed:()async{
              Navigator.of(context).pop(controller.text);
            },
          ),
        ],
      );
    }
  );
}


class BasicCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const BasicCard({super.key,required this.child,this.padding});

  @override
  Widget build(BuildContext context){
    return Container(
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor, 
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
