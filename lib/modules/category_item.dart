import 'package:flutter/material.dart';
import 'package:news_own/models/category_data.dart';

class CategoryItem extends StatelessWidget {
  CategoryData categoryData;
  int index;

  CategoryItem({required this.categoryData, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.02,
          right: MediaQuery.of(context).size.width * 0.02,
          top: MediaQuery.of(context).size.height * 0.01,
          bottom: MediaQuery.of(context).size.height * 0.01),
      decoration: BoxDecoration(
          color: categoryData.color,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(25),
            topRight: const Radius.circular(25),
            bottomLeft: index.isEven ? const Radius.circular(25) : Radius.zero,
            bottomRight: index.isEven ? Radius.zero : const Radius.circular(25),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Image.asset(
              categoryData.image,
              height: MediaQuery.of(context).size.height * 0.14,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(categoryData.title, style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),),
            ),
          )
        ],
      ),
    );
  }
}
