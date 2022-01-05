import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_peoject/bloc/new_controller/news_controller_cubit.dart';
import 'dart:math' as math;

class ExploreCustomWidget extends StatelessWidget {
  const ExploreCustomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsControllerCubit, NewsControllerState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        NewsControllerCubit newsController =
        BlocProvider.of<NewsControllerCubit>(context);
        return newsController.sourceLoading
            ? Center(
          child: CircularProgressIndicator(),
        )
            : Container(
          height: 130.0,
          child: ListView.builder(
              itemCount: newsController.sourceData!.source!.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(10.0),
              itemBuilder: (context, index) => Container(
                height: 150.0,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40.0,
                      backgroundImage: AssetImage(
                          "assets/images/${math.Random().nextInt(11) + 1}.jpg"),
                    ),
                    SizedBox(height: 5.0,),
                    Text(
                      newsController
                          .sourceData!.source![index].name
                          .toString().length<9?newsController
                          .sourceData!.source![index].name
                          .toString():'${newsController
                          .sourceData!.source![index].name
                          .toString().substring(0,8)}..',
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )),
        );
      },
    );
  }
}
