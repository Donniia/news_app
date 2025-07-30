import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../DataLayer/Model/NewsResponse/news.dart';



class NewsDetails extends StatelessWidget {
  static const String routeName = 'newsDetails';

  @override
  Widget build(BuildContext context) {
    final news = ModalRoute.of(context)!.settings.arguments as News;

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("Assets/bg.png"), fit: BoxFit.fill)),
      child: Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: CachedNetworkImage(
                    imageUrl: news.urlToImage ?? "",
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress)),
                    errorWidget: (context, url, error) => Icon(Icons.error),
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
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  color: Colors.white,
                  child: Text(
                    news.content ?? '',
                    style: const TextStyle(
                        color: Color(0xff42505C),
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              const SizedBox(height: 25,),
             InkWell(
               onTap: (){
                 _launchUrl(news.url??'');
               },
               child: const  Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("View Full Article",style: TextStyle(color: Color(0xff42505C),fontSize: 16,fontWeight: FontWeight.w600),),
                    Icon(Icons.arrow_right_outlined)
                  ],
                ),
             )
                
              ],
            ),
          )),
    );
  }
}
Future<void> _launchUrl(String url) async {
  Uri uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $url');
  }
}