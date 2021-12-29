

import 'package:shared_preferences/shared_preferences.dart';

mixin CashDataPref{
  late SharedPreferences sharedPreferences;
  init()async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  putData({required String key,required dynamic value})async{
    if(value is bool){
      return await sharedPreferences.setBool(key, value);
    }else{
      return await sharedPreferences.setString(key, value);
    }
  }

  getData({required String key}){
    return sharedPreferences.get(key);
  }
}