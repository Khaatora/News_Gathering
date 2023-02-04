import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_own/models/NewsDataModel.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {

  static const String routeName = "News_Details_Screen";

  @override
  Widget build(BuildContext context) {
    var article = ModalRoute.of(context)!.settings.arguments as Articles;
    return Scaffold(
      appBar: AppBar(title : SingleChildScrollView(scrollDirection: Axis.horizontal,child: Text("${article.title}"))),
      body: Container(
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
              imageUrl: article.urlToImage ?? "",
              height: 180,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator( color: Colors.green,)),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            // Image.network(articles.urlToImage ?? "", height: 180),
            Text(article.author ?? "", style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade500,
            ), textAlign: TextAlign.left),
            const SizedBox(height: 10,),
            Text(article.title ?? "", style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),),
            Text(article.publishedAt?.substring(0,10) ?? "", textAlign: TextAlign.right,),
            const SizedBox(height: 10,),
            Text(article.description ?? ""),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              TextButton.icon(onPressed: () {
                openUrl(article.url);
                              }, icon: const Text("View Full Article", style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14
              ),) , label: const Icon(Icons.arrow_forward, size: 16,), style: const ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Colors.black),
              ),)
            ],)
          ],
        ),
      ),
    );
  }

  void openUrl(String? url) async{
    if(url == null){
      return;
    }
    var uri = Uri.parse(url);
    if(await canLaunchUrl(uri)){
      await launchUrl(uri);
    }
  }
}
