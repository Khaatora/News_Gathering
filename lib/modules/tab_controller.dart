import 'package:flutter/material.dart';
import 'package:news_own/models/SourcesResponse.dart';
import 'package:news_own/modules/tab_item.dart';
import 'package:news_own/shared/network/remote/api_manager.dart';

class TabControllerScreen extends StatefulWidget {
  List<Sources> sources;

  TabControllerScreen(this.sources);

  @override
  State<TabControllerScreen> createState() => _TabControllerScreenState();
}

class _TabControllerScreenState extends State<TabControllerScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
              isScrollable: true,
              indicatorColor: Colors.transparent,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              tabs: widget.sources
                  .map((source) =>
                      //tab is used as substitute to using texts within containers and having to adjust the padding and margin
                      Tab(
                        child: TabItem(source,
                            widget.sources.indexOf(source) == selectedIndex),
                      ))
                  .toList()),
        ),
        FutureBuilder(
          future:
              ApiManager.getNewsData(widget.sources[selectedIndex].id ?? ""),
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
                  itemBuilder: (context, index) => Text(news[index].title ?? "")),
            );
          },
        )
      ],
    );
  }
}
