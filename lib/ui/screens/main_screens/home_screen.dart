import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_peoject/bloc/new_controller/news_controller_cubit.dart';
import 'package:news_peoject/ui/widgets/news_widgets/custom_slider.dart';
import 'package:news_peoject/ui/widgets/news_widgets/custom_tabs.dart';

class HomeScreen extends StatelessWidget {
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
            : Column(
              children: [
                CustomSlider(),
                SizedBox(height: 10.0,),
                if(!newsController.sportsLoading)
                Expanded(child: CustomTabs()),
              ],
            );
      },
    );
  }
}
