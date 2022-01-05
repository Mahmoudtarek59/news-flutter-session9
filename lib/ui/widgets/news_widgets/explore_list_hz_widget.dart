import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_peoject/bloc/new_controller/news_controller_cubit.dart';


class ExploreListHZWidget extends StatelessWidget {

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
            ? Container()
            : Container(
          height: 260.0,
          child: ListView.builder(
              padding: EdgeInsets.all(5.0),
              physics: ScrollPhysics(),
              itemCount: newsController.trendingData!.news!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(15.0),
                          image: DecorationImage(
                              image: NetworkImage(newsController
                                  .trendingData!
                                  .news![index]
                                  .urlToImage
                                  .toString()),
                              fit: BoxFit.cover)),
                      height: 150.0,
                      width: 250.0,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    FittedBox(
                      fit: BoxFit.contain,
                      child: Container(
                        width: 220.0,
                        margin: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              newsController.trendingData!
                                  .news![index].newSource!.name
                                  .toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .caption,
                            ),
                            Text(
                              newsController.trendingData!
                                  .news![index].description
                                  .toString(),
                              maxLines: 2,softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }
}
