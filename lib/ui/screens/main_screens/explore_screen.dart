import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_peoject/bloc/new_controller/news_controller_cubit.dart';
import 'package:news_peoject/ui/screens/main_screens/trending_screen.dart';
import 'package:news_peoject/ui/widgets/news_widgets/explore_custom_widget.dart';
import 'package:news_peoject/ui/widgets/news_widgets/explore_list_hz_widget.dart';
import 'package:news_peoject/ui/widgets/news_widgets/explore_list_widget.dart';
import 'package:news_peoject/ui/widgets/news_widgets/news_list_widget.dart';
import 'dart:math' as math;

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: InkWell(
            onTap: (){},
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                suffixIcon: Icon(Icons.search,color: Colors.black54,),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  // borderSide: BorderSide.none,
                ),
              ),
              enabled: false,
            ),
          ),
        ),
        ExploreCustomWidget(),
        ExploreListHZWidget(),
        ExploreListWidget(),
      ],
    );
  }
}
