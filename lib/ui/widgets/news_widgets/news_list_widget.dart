import 'package:flutter/material.dart';
import 'package:news_peoject/models/news.dart';

class NewsListWidget extends StatelessWidget {
  final List<News>? news;
  NewsListWidget({required this.news});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        itemCount: news!.length,
        padding: EdgeInsets.all(10.0),
        itemBuilder: (context, index) => Container(
          height: 100.0,
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  news![index].urlToImage
                      .toString(),
                  height: 100.0,
                  width: 100.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10.0,),
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news![index].newSource!.name
                            .toString(),
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                        news![index].description
                            .toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      Text(
                          news![index].publishedAt.toString(),
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}
