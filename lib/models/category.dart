import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:orilla_fresca_app/models/subcategory.dart';

class Category {
  String? name;
  String? icon;
  Color? color;
  String? imgName;
  List<Category>? subCategories;

  Category(
    {
      this.name,
      this.icon,
      this.color, 
      this.imgName,
      this.subCategories
    }
  );

  factory Category.fromJson(Map<String, dynamic> json) {

    return Category(
      color: Color(int.parse('0xFF' + json['color'])),
      icon: json['icon'],
      name: json['name'],
      imgName: json['imgName'],
      subCategories: SubCategory.fromJsonArray(json['subCategories'])
    );
  }
}