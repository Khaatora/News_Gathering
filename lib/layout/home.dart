import 'package:flutter/material.dart';
import 'package:news_own/models/SourcesResponse.dart';
import 'package:news_own/modules/tab_controller.dart';
import 'package:news_own/shared/network/remote/api_manager.dart';

class HomeLayout extends StatelessWidget {
  static const routeName = "Home_Screen";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/pattern.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.green,
          elevation: 0.0,
          shape: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25))
        ),
          title: const Text("News"),
        ),
        body: FutureBuilder<SourcesResponse>(
          future: ApiManager.getSources(),
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
        ),
      ),
    );
  }
}
