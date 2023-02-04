import 'package:flutter/material.dart';
import 'package:news_own/models/category_data.dart';
import 'package:news_own/modules/category_item.dart';

class CategoryScreen extends StatelessWidget {
  Function onCategorySelect;

  CategoryScreen(this.onCategorySelect);

  @override
  Widget build(BuildContext context) {
    var categories = CategoryData.getCategories();
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.01,
              horizontal: MediaQuery.of(context).size.width * 0.03),
          child: const Text(
            "Pick Your Category of Interest",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 12, crossAxisSpacing: 12, crossAxisCount: 2),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    onCategorySelect(categories[index]);
                  },
                  child: CategoryItem(
                    categoryData: categories[index],
                    index: index,
                  ));
            },
          ),
        )
      ],
    );
  }
}
