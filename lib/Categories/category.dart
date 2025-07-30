import 'dart:ui';

class Category {
  String id;
  String title;
  Color color;
  String imagePath;
  Category(this.id, this.title, this.color, this.imagePath);

  static List<Category> getAllCategories() {
    return [
      Category('sports', "Sports", Color(0xffC91C22), "sports.png"),
      Category('general', 'General', Color(0xff003E90), 'Politics.png'),
      Category('health', 'Health', Color(0xffED1E79), 'health.png'),
      Category('business', 'Business', Color(0xffCF7E48), 'bussines.png'),
      Category('technology', 'Technology', Color(0xff4882CF), 'environment.png'),
      Category('science', 'Science', Color(0xffF2D352), 'science.png'),
    ];
  }
}
