import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:news_peoject/models/news.dart';
import 'package:news_peoject/models/source.dart';
import 'package:news_peoject/shared/constants.dart';
import 'package:news_peoject/shared/network/newwork.dart';

part 'news_controller_state.dart';

class NewsControllerCubit extends Cubit<NewsControllerState> with DioHelper {
  NewsControllerCubit() : super(NewsControllerInitial());


  ///source
  bool sourceLoading = false;
  SourceData? sourceData;

  getSources() async {
    sourceLoading = true;
    emit(SourceLoadingState());
    await getData("top-headlines/sources", {
      "apiKey": apiKey,
    }).then((value){
      sourceData = SourceData.fromJson(value.data);

      sourceLoading = false;
      emit(SourceSuccessLoadingState());
    }).catchError((e){
      sourceLoading = false;
      emit(SourceErrorLoadingState(error: e.toString()));
    });

  }


  ///Trending
  bool trendingLoading = false;
  NewsData? trendingData;

  getTrending() async {

    trendingLoading = true;
    emit(TrendingLoadingState());
    await getData("top-headlines", {
      "apiKey": apiKey,
      "country":"eg"
    }).then((value){
      trendingData = NewsData.fromJson(value.data);
      trendingLoading = false;
      emit(TrendingSuccessLoadingState());
    }).catchError((e){
      trendingLoading = false;
      emit(TrendingErrorLoadingState(error: e.toString()));
    });

  }


  ///Sports
  bool sportsLoading = false;
  NewsData? sportsData;

  getSports() async {
    sportsLoading = true;
    emit(SportsLoadingState());
    await getData("top-headlines", {
      "apiKey": apiKey,
      "category":"sports",
      "country":"eg"
    }).then((value){
      sportsData = NewsData.fromJson(value.data);
      sportsLoading = false;
      emit(SportsSuccessLoadingState());
    }).catchError((e){
      sportsLoading = false;
      emit(SportsErrorLoadingState(error: e.toString()));
    });

  }
}
