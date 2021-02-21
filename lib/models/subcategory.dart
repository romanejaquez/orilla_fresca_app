import 'dart:ui';

import 'category.dart';

class SubCategory extends Category {

  SubCategory({
    String name,
    String icon,
    Color color,
    String imgName 
  }): super(
    name: name,
    icon: icon,
    color: color,
    imgName: imgName
  );
}