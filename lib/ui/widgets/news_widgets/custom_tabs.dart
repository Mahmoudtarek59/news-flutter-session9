import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_peoject/bloc/new_controller/news_controller_cubit.dart';
import 'package:news_peoject/models/news.dart';
import 'package:news_peoject/ui/widgets/news_widgets/news_list_widget.dart';

class CustomTabs extends StatefulWidget {
  @override
  _CustomTabsState createState() => _CustomTabsState();
}

class _CustomTabsState extends State<CustomTabs>
    with SingleTickerProviderStateMixin {
  late TabController tabBarController;

  @override
  void initState() {
    tabBarController = TabController(
      vsync: this,
      length: tabs.length,
    );
  }

  List<Tab> tabs = [
    Tab(
      text: "sport".toUpperCase(),
    ),
    Tab(
      text: "technology".toUpperCase(),
    ),
    Tab(
      text: "health".toUpperCase(),
    ),
    Tab(
      text: "business".toUpperCase(),
    ),
    Tab(
      text: "entertainment".toUpperCase(),
    ),
    Tab(
      text: "science".toUpperCase(),
    ),
    Tab(
      text: "general".toUpperCase(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsControllerCubit, NewsControllerState>(
      builder: (context, state) {
        NewsControllerCubit newsController =
            BlocProvider.of<NewsControllerCubit>(context);
        return Column(
          children: [
            TabBar(
                physics: ScrollPhysics(),
                isScrollable: true,
                indicatorColor: Theme.of(context).colorScheme.primary,
                unselectedLabelColor: Colors.grey.shade500,
                labelColor: Theme.of(context).colorScheme.onPrimary,
                // unselectedLabelColor: Theme.of(context).,
                controller: tabBarController,
                tabs: tabs),
            Expanded(
              child: TabBarView(
                  controller: tabBarController,
                  physics: BouncingScrollPhysics(),
                  children: [
                    newsController.sportsLoading
                        ? Container()
                        : NewsListWidget(news: newsController.sportsData!.news),
                    Container(),
                    Container(),
                    Container(),
                    Container(),
                    Container(),
                    Container(),
                  ]),
            ),
          ],
        );
      },
    );
  }
}
