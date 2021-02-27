import 'dart:ui';
import 'package:orilla_fresca_app/helpers/unitenums.dart';
import 'package:orilla_fresca_app/models/categorypart.dart';
import 'category.dart';

class SubCategory extends Category {

  List<CategoryPart> parts;
  double price;
  WeightUnits unit;

  SubCategory({
    this.parts = const [],
    this.price = 0.0,
    this.unit = WeightUnits.Lb,
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