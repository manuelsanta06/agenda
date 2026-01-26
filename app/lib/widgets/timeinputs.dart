import 'package:flutter/material.dart';
import '../constants.dart' as constants;

Future<DateTime?> getDate(BuildContext context,DateTime? initialDate)async{
  return await showDatePicker(
    context: context,
    initialDate: initialDate??DateTime.now(),
    initialDatePickerMode: DatePickerMode.day,
    initialEntryMode: DatePickerEntryMode.calendar,
    firstDate: constants.firstDate,
    lastDate: constants.lastDay,
  );
}
Future<TimeOfDay?> getTime(BuildContext context)async{
  return await showTimePicker(
  context: context,
    initialTime: TimeOfDay(hour: 0,minute: 0),
    initialEntryMode: TimePickerEntryMode.dial,
    orientation: Orientation.portrait,
    builder: (BuildContext context, Widget? child) {
      return Directionality(
        textDirection: TextDirection.ltr,
        child: child!,
      );
    },
  );
}
Future<DateTime?> getDatetime(BuildContext context,DateTime? initialDate)async{
  final DateTime? date=await getDate(context,initialDate);
  if(date==null)return null;
  final TimeOfDay? time=await getTime(context);
  if(time==null)return null;
  return DateTime(date.year,date.month,date.day,time.hour,time.minute);
}

