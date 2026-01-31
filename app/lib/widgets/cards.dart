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
        child:child,
      ):
      child;
    return Container(
      margin: margin,
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:tonality==null?
          Theme.of(context).cardColor:
          Color.alphaBlend(tonality!.withAlpha(50),Theme.of(context).cardColor),
        borderRadius: BorderRadius.circular(16),
        border: BoxBorder.all(color:borderColor??Colors.black,width:borderColor==null?0:2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child:actionIcon == null
        ?content
        :Stack(
          children: [
            content,
            Positioned.fill(
              child: Align(
                alignment: actionPosition,
                child:onActionPressed != null
                  ?InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: onActionPressed,
                    child: actionIcon,
                  )
                  : actionIcon,
              ),
            ),
          ],
        ),
    );
  }
}
