import 'package:agenda/database/app_database.dart';
import 'package:flutter/material.dart';

String getDayLetter(WeekDays day) {
  switch (day) {
    case WeekDays.MONDAY: return 'L';
    case WeekDays.TUESDAY: return 'M';
    case WeekDays.WEDNESDAY: return 'M';
    case WeekDays.THURSDAY: return 'J';
    case WeekDays.FRIDAY: return 'V';
    case WeekDays.SATURDAY: return 'S';
    case WeekDays.SUNDAY: return 'D';
    default: return '';
  }
}

Widget stopToDot(Stop stop, bool fillDot, Color maincolor,{bool vertical=false}) {
  final timeText = stop.start != null 
    ? "${stop.start!.hour.toString().padLeft(2,'0')}:${stop.start!.minute.toString().padLeft(2,'0')}" 
    : "--:--";
  final dotWidget=Container(
    width: 12,
    height: 12,
    decoration: BoxDecoration(
      color: fillDot ? maincolor : Colors.white,
      shape: BoxShape.circle,
      border:Border.all(color:maincolor,width:2.5),
      boxShadow: const [
        BoxShadow(color:Colors.white12,spreadRadius:3),
      ],
    ),
  );

  if(vertical){return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Expanded(
        //width: 40, 
        child: Text(timeText, 
          textAlign: TextAlign.end,
          style: TextStyle(fontSize: 10, color: Colors.grey.shade600, fontWeight: FontWeight.w600)
        )
      ),
      
      const SizedBox(width: 8),
      dotWidget, // El punto
      const SizedBox(width: 8),

      Expanded(
        child: Text(
          stop.name,
          maxLines: 1,
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );}

  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      //time above the dot
      Text( timeText,
        style: TextStyle(
          fontSize: 10,
          color: Colors.grey.shade600,
          fontWeight: FontWeight.w600,
        ),
      ),
      
      const SizedBox(height: 4),
      dotWidget,
      const SizedBox(height: 4),

      //stop name
      SizedBox(
        width: 65, 
        child: Text(
          stop.name,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            height: 1.1,
          ),
        ),
      ),
    ],
  );
}

Widget stopsLineHorizontal(List<Stop> sto,bool repeat,Color maincolor){
  final stopsToShow = sto.length > 5? 
    [sto.first, sto.last] 
    :sto;
  bool fillDot=true;
  final now=DateTime.now();

  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8),
    child:Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 2,
          color: Colors.grey.shade300,
          margin: const EdgeInsets.symmetric(horizontal: 10), 
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:stopsToShow.map((stop) {
            DateTime? stopDay;
            if((!repeat)||stop.start==null)stopDay=stop.start;
            else{
              stopDay=DateTime(
                now.year, 
                now.month, 
                now.day, 
                stop.start!.hour, 
                stop.start!.minute
              );
            }
            if(stopDay?.isAfter(DateTime.now())??false)fillDot=false;
            return stopToDot(stop,fillDot,maincolor);
          }).toList(),
        ),
        if(sto.length > 5)
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          color: Colors.white,
          child: Text(
            "+${sto.length - 2}", 
            style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold)
          ),
        ),
      ],
    )
  );
}

Widget stopsLineVertical(List<Stop> sto, bool repeat, Color maincolor) {
  bool fillDot = true;
  final now = DateTime.now();

  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8),
    alignment: Alignment.center,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: 2,
              color: Colors.grey.shade300,
            ),
          ),
        ),
        Column(
          children: sto.map((stop) {
            DateTime? stopDay;
            if((!repeat)||stop.start==null) stopDay = stop.start;
            else {
              stopDay = DateTime(
                now.year,
                now.month,
                now.day,
                stop.start!.hour,
                stop.start!.minute,
              );
            }
            if (stopDay?.isAfter(DateTime.now()) ?? false) fillDot = false;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: stopToDot(stop,fillDot,maincolor,vertical:true),
            );
          }).toList(),
        ),
      ],
    ),
  );
}

Widget weekDaysDots(List<WeekDays>? selectedDays,Color maincolor){
  return Container(
    //alignment: Alignment.centerLeft,
    margin: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children:WeekDays.values.map((day){
        if(day==WeekDays.NONE)return Container();
        return Container(
          width: 20,
          height: 20,
          margin: const EdgeInsets.only(right: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (selectedDays?.contains(day)??false)?maincolor:Colors.grey,
          ),
          alignment: Alignment.center,
          child: Text(
            getDayLetter(day), // Función auxiliar para la letra
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              // Si está activo: Letra blanca. Si no: Letra gris.
              color:Colors.white,
            ),
          ),
        );
      }).toList(),
    )
  );
}

