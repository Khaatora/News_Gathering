import 'package:flutter/material.dart';
import 'package:news_own/models/SourcesResponse.dart';
import 'package:news_own/models/category_data.dart';
import 'package:news_own/modules/tab_controller.dart';
import 'package:news_own/shared/network/remote/api_manager.dart';

class HomeScreen extends StatelessWidget {

  CategoryData categoryData;

  HomeScreen(this.categoryData);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
      future: ApiManager.getSources(categoryData.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.data?.message ?? ""),
          );
        }
        if (snapshot.data?.status != 'ok') {
          Center(
            child: Text("${snapshot.data?.message}"),
          );
        }
        var sources = snapshot.data?.sources ?? [];
        return TabControllerScreen(sources);
      },
    );
  }
}
