

import 'package:dio/dio.dart';
import 'package:news_peoject/shared/constants.dart';

mixin DioHelper{
  late Dio dio;
  init(){
    dio = Dio(
      BaseOptions(baseUrl: url,),
    );
  }

  Future getData(String path,dynamic queryParameters)async{
    init();
    return await dio.get(path,queryParameters: queryParameters);

  }
}