
String phoneParser(String number){
  final buffer=StringBuffer();
  for(int i=0;i<number.length;i++){
    final codigo=number.codeUnitAt(i);
    if(codigo>=48&&codigo<=57)buffer.writeCharCode(codigo);
  }
  String result=buffer.toString();
  return (result.length<=10?"54":"")+(result.length<=8?"11":"")+result;
}

String numberParser(int number) {
  String str = number.toString();
  
  if (str.length <= 3) return str;

  return numberParser(int.parse(str.substring(0, str.length - 3))) + 
         '.' + 
         str.substring(str.length - 3);
}
String numberStringParser(String number) {
  if (number.length <= 3) return number;

  return numberParser(int.parse(number.substring(0,number.length-3)))+ 
         '.' + 
         number.substring(number.length - 3);
}
