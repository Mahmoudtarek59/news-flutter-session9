part of 'news_controller_cubit.dart';

@immutable
abstract class NewsControllerState {}

class NewsControllerInitial extends NewsControllerState {}

///source
class SourceLoadingState extends NewsControllerState{}
class SourceSuccessLoadingState extends NewsControllerState{}
class SourceErrorLoadingState extends NewsControllerState{
  final String error;
  SourceErrorLoadingState({required this.error});
}


///trending
class TrendingLoadingState extends NewsControllerState{}
class TrendingSuccessLoadingState extends NewsControllerState{}
class TrendingErrorLoadingState extends NewsControllerState{
  final String error;
  TrendingErrorLoadingState({required this.error});
}


///sports
class SportsLoadingState extends NewsControllerState{}
class SportsSuccessLoadingState extends NewsControllerState{}
class SportsErrorLoadingState extends NewsControllerState{
  final String error;
  SportsErrorLoadingState({required this.error});
}


