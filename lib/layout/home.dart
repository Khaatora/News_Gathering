import 'package:flutter/material.dart';
import 'package:news_own/layout/Search/news_search.dart';
import 'package:news_own/models/category_data.dart';
import 'package:news_own/modules/category_screen.dart';
import 'package:news_own/modules/drawer_screen.dart';
import 'package:news_own/modules/home_screen.dart';

class HomeLayout extends StatefulWidget {
  static const routeName = "Home_Screen";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
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
          actions: [IconButton(onPressed: () {
            showSearch(context: context, delegate: NewsSearch());
          }, icon: const Icon(Icons.search, size: 32,))],
        ),
        drawer: DrawerScreen(onDrawerSelected),
        body:  categoryData == null? CategoryScreen(onCategorySelected):HomeScreen(categoryData!),
      ),
    );
  }

  CategoryData? categoryData= null;

  void onCategorySelected(categorySelected){
    categoryData = categorySelected;
    setState(() {

    });
  }

  void onDrawerSelected(number){
    if(number == DrawerScreen.CATEGORIES){
      categoryData = null;
    }else if(number == DrawerScreen.SETTINGS){
      // open settings screen
    }
    setState(() {
      Navigator.pop(context);
    });
  }
}
