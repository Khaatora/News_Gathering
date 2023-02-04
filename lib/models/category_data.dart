import 'dart:ui';

class CategoryData{
  String id;
  String title;
  String image;
  Color color;

  CategoryData(this.id, this.title, this.image, this.color);
  
  static List<CategoryData> getCategories(){
    return [
      CategoryData("sports",
          "Sports", "assets/images/sports.png",
          const Color(0xFFC91C22)),
      CategoryData("business",
          "Business", "assets/images/bussines.png",
          const Color(0xFFCF7E48)),
      CategoryData("entertainment",
          "Entertainment", "assets/images/politics.png",
          const Color(0xFF003E90)),
      CategoryData("general",
          "General", "assets/images/environment.png",
          const Color(0xFF4882CF)),
      CategoryData("health",
          "Health", "assets/images/health.png",
          const Color(0xFFED1E79)),
      CategoryData("science",
          "Science", "assets/images/science.png",
          const Color(0xFFF2D352)),
    ];
  }
  
}