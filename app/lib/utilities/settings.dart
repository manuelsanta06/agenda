import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  SharedPreferences? _prefs;

  //Defalts dictionary
  static const Map<String, dynamic> _defaults = {
    'dark_mode':true,
    'colectivos_order':0,
  };

  Future<void> init() async {
    _prefs=await SharedPreferences.getInstance();
    notifyListeners();
  }

  T getValue<T>(String key){
    //All keys need a default
    assert(_defaults.containsKey(key), 'The key "$key" has no default value.');
    if(_prefs==null)return _defaults[key] as T;

    final value=_prefs!.get(key);
    if(value is T)return value;
    return _defaults[key] as T;
  }

  Future<void> setValue<T>(String key,T value)async{
    if(_prefs==null)return;

    if(value is bool){
      await _prefs!.setBool(key,value);
    }else if(value is String){
      await _prefs!.setString(key,value);
    }else if(value is int){
      await _prefs!.setInt(key,value);
    }else if(value is double){
      await _prefs!.setDouble(key,value);
    }
    notifyListeners();
  }
}
