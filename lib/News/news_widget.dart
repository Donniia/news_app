import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/News/news_details.dart';

import '../DataLayer/Model/NewsResponse/news.dart';

class NewsWidget extends StatelessWidget {
  NewsWidget(this.news, {super.key});
  News news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: (){
            Navigator.pushNamed(context, NewsDetails.routeName, arguments: news);
            },
            child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child:CachedNetworkImage(
                  imageUrl: news.urlToImage ?? "",
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),


                ),
          ),
          Text(
            news.author ?? "",
            textAlign: TextAlign.start,
            style: const TextStyle(
                color: Color(0xff79828B),
                fontSize: 15,
                fontWeight: FontWeight.w400),
          ),
          Text(
            news.title ?? "",
            style: const TextStyle(
                color: Color(0xff42505C),
                fontWeight: FontWeight.w500,
                fontSize: 18),
          ),
          Text(
            news.publishedAt ?? '',
            style: const TextStyle(
                fontSize: 13,
                color: Color(0xffA3A3A3),
                fontWeight: FontWeight.w400),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
