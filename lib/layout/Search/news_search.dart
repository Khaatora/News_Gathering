import 'package:flutter/material.dart';
import 'package:news_own/models/NewsDataModel.dart';
import 'package:news_own/modules/NewsCard.dart';
import 'package:news_own/shared/network/remote/api_manager.dart';

class NewsSearch extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () {
        showResults(context);
      }, icon: const Icon(
        Icons.search,
        size: 25,
      ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {
      Navigator.pop(context);
    }, icon: const Icon(
      Icons.clear,
      size: 25,
    ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<NewsDataModel>(
      future:
      ApiManager.getNewsData(queryKeyword: query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          );
        }
        if (snapshot.hasError) {
          Column(
            children: [
              Text(snapshot.data?.message ?? "There is an error"),
              TextButton(
                onPressed: () {},
                child: const Text("Try Again"),
              )
            ],
          );
        }
        if (snapshot.data?.status != "ok") {
          Column(
            children: [
              Text(snapshot.data?.message ?? "There is an error"),
              TextButton(
                onPressed: () {},
                child: const Text("Try Again"),
              )
            ],
          );
        }

        var news = snapshot.data?.articles ?? [];
        return Expanded(
          child: ListView.builder(
              itemCount: news.length,
              itemBuilder: (context, index) => NewsCard(news[index])),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: Text("Suggestions"));
  }
  
}