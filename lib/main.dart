import 'package:flutter/material.dart';
import 'package:news_own/layout/home.dart';
import 'package:news_own/modules/news_details_screen/news_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName : (context) => HomeLayout(),
        NewsDetailsScreen.routeName: (context) => NewsDetailsScreen(),
      },
      debugShowCheckedModeBanner: false,

    );
  }
}

