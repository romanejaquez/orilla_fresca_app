import 'package:flutter/material.dart';

import 'iconfont.dart';

class CategoryIcon extends StatelessWidget {
  Color? color;
  String? iconName;
  double size;
  double padding;

  CategoryIcon({
    this.color, 
    this.iconName, 
    this.size = 30,
    this.padding = 10  
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
          color: this.color,
          padding: EdgeInsets.all(this.padding),
          child: IconFont(
              color: Colors.white, iconName: this.iconName, size: this.size)),
    );
  }
}
