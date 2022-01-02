import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_peoject/bloc/new_controller/news_controller_cubit.dart';
import 'dart:math' as math;

import 'package:news_peoject/ui/widgets/source_widget/Source_widget.dart';

class SourceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsControllerCubit, NewsControllerState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        NewsControllerCubit newsController =
            BlocProvider.of<NewsControllerCubit>(context);
        return newsController.sourceLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SourceWidget(sources: newsController.sourceData!.source);
      },
    );
  }
}
