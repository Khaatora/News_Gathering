import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_own/models/NewsDataModel.dart';
import 'package:news_own/modules/news_details_screen/news_details_screen.dart';

class NewsCard extends StatelessWidget {

Articles articles;


NewsCard(this.articles);

@override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, NewsDetailsScreen.routeName, arguments: articles),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.02 ,horizontal: MediaQuery.of(context).size.width * 0.02),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CachedNetworkImage(
              imageUrl: articles.urlToImage ?? "",
              height: 180,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator( color: Colors.green,)),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            // Image.network(articles.urlToImage ?? "", height: 180),
            Text(articles.author ?? "", style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade500,
            ), textAlign: TextAlign.left),
            Text(articles.title ?? "", style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),),
            Text(articles.publishedAt?.substring(0,10) ?? "", textAlign: TextAlign.right,),
          ],
        ),
      ),
    );
  }
}
