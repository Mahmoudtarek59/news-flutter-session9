import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_peoject/bloc/new_controller/news_controller_cubit.dart';
import 'package:news_peoject/ui/widgets/news_widgets/news_list_widget.dart';


class ExploreListWidget extends StatelessWidget {
  const ExploreListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsControllerCubit, NewsControllerState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        NewsControllerCubit newsController =
        BlocProvider.of<NewsControllerCubit>(context);
        return newsController.trendingLoading
            ? Center(
          child: CircularProgressIndicator(),
        )
            : NewsListWidget(
            news: newsController.trendingData!.news!.reversed.toList());
      },
    );
  }
}
