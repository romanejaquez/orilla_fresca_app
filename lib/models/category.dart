import 'dart:ui';

class Category {
  String name;
  String icon;
  Color color;
  String imgName;
  List<Category> subCategories;

  Category(
    {
      this.name,
      this.icon,
      this.color, 
      this.imgName,
      this.subCategories
    }
  );
}