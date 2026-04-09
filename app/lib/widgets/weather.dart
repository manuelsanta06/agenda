import 'package:agenda/widgets/text.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  //TODO: dinamic location
  static const double lat = -34.76;
  static const double lon = -58.40;

  static Future<(double, String)?> getCurrentWeather()async{
    try{
      final uri=Uri.parse(
        'https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&current_weather=true'
      );

      final response=await http.get(uri);
      if(response.statusCode==200){
        final data=jsonDecode(response.body);
        final current=data['current_weather'];
        final double temp=current['temperature'];
        final int code=current['weathercode'];
        return (temp,_getWeatherEmoji(code));
      }
      return null;
    }catch(e){
      print("Error obteniendo el clima: $e");
      return null;
    }
  }

  static String _getWeatherEmoji(int code){
    if(code==0) return '☀️';
    if(code==1||code==2||code==3)return '⛅';
    if(code==45||code==48)return '🌫️';
    if(code>=51&&code<=67)return '🌧️';
    if(code>=71&&code<=77)return '❄️';
    if(code>=80&&code<=82)return '🌦️';
    if(code>=95&&code<=99)return '⛈️';
    return '☁️';
  }
}
class WeatherWidget extends StatelessWidget{
  final Color mainColor;
  const WeatherWidget({
    super.key,
    this.mainColor=Colors.blueGrey,
  });

  @override
  Widget build(BuildContext context){
    return FutureBuilder<(double,String)?>(
      future: WeatherService.getCurrentWeather(),
      builder:(context,snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return pillProgress(text:"        ",mainColor:mainColor,value:null,onTap:(){});
        }
        if(snapshot.hasError||!snapshot.hasData||snapshot.data==null){return const SizedBox.shrink();}
        final (temp,emoji)=snapshot.data!;
        return pillText("$emoji ${temp.toStringAsFixed(1)}°C",mainColor,onTap:(){});
      },
    );
  }
}
