import 'package:flutter/material.dart';

class DataLine extends StatelessWidget {
  final String text;
  final Color mainColor;
  final Color? textColor;

  const DataLine({
    super.key,
    this.textColor,
    required this.text,
    required this.mainColor,
  });

  @override
  Widget build(BuildContext context){
    return Padding(
      padding:const EdgeInsets.only(bottom:2),
      child:Row(
        children:[
          Container(
            width:6, height:6,
            margin:const EdgeInsets.only(right:8),
            decoration: BoxDecoration(shape:BoxShape.circle,color:mainColor),
          ),
          Expanded(child:Text(text,style:TextStyle(
            fontSize:12,
            color:textColor??Theme.of(context).colorScheme.onSurface.withOpacity(0.87)
          ))),
        ],
      ),
    );
  }
}

Widget subtitleLine(String title,Color mainColor){
  return Container(
    margin: const EdgeInsets.only(bottom: 10, left: 4),
    padding: const EdgeInsets.only(left: 10),
    decoration: BoxDecoration(
      border:Border(left:BorderSide(color:mainColor, width:4.0,)),
    ),
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget pillText(String text, Color mainColor, {VoidCallback? onTap}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: mainColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: mainColor.withOpacity(0.5)),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: mainColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

bool isToday(DateTime date){
  final now = DateTime.now();
  return date.day == now.day &&
    date.month == now.month &&
    date.year == now.year;
}

bool isYesterday(DateTime date){
  var yesterday = DateTime.now().subtract(Duration(days: 1));
  return date.day == yesterday.day &&
    date.month == yesterday.month &&
    date.year == yesterday.year;
}

String relativeDate(DateTime date,{bool montlhy=false}){
  if(isToday(date))return "Hoy";
  if(isYesterday(date))return "Ayer";
  final days=date.difference(DateTime.now()).inDays*-1;
  if(montlhy&&(days)>30)
    return "Hace ${days~/30} mes${days~/30!=1?"es":""}, ${days%30} dias";
  return "Hace $days dias";
}
