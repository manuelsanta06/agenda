
String phoneParser(String number){
  final buffer=StringBuffer();
  for(int i=0;i<number.length;i++){
    final codigo=number.codeUnitAt(i);
    if(codigo>=48&&codigo<=57)buffer.writeCharCode(codigo);
  }
  String result=buffer.toString();
  return (result.length<=10?"54":"")+(result.length<=8?"11":"")+result;
}
