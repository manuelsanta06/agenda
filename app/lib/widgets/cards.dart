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
  final EdgeInsetsGeometry? margin;
  final Color? tonality;
  final Color? borderColor;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;
  final Widget? actionIcon;
  final VoidCallback? onActionPressed;
  final AlignmentGeometry actionPosition;

  const BasicCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.tonality,
    this.borderColor,
    this.onPressed,
    this.onLongPressed,
    this.actionIcon,
    this.onActionPressed,
    this.actionPosition = Alignment.topRight,
  });

  @override
  Widget build(BuildContext context){
    final content=(onPressed!=null||onLongPressed!=null)?
      InkWell(
        onTap: onPressed,
        onLongPress: onLongPressed,
        child:Padding(padding:padding??const EdgeInsets.all(16),child:child),
      ):
      Padding(padding:padding??const EdgeInsets.all(16),child:child);
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child:Material(
        color:tonality==null?
          Theme.of(context).cardColor:
          Color.alphaBlend(tonality!.withAlpha(50),Theme.of(context).cardColor),
        clipBehavior: Clip.hardEdge,
        shape:RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(16),
          side:borderColor==null?
            BorderSide.none 
            :BorderSide(color:borderColor!,width: 2),
        ),
        child:actionIcon == null
          ?content
          :Stack(children:[
            SizedBox(width: double.infinity, child: content),
            Positioned.fill(
              child:Align(
                alignment:actionPosition,
                child:onActionPressed != null
                  ?InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: onActionPressed,
                    child: actionIcon,
                  )
                  : actionIcon,
              ),
            ),
          ],)
      ),
    );
  }
}
