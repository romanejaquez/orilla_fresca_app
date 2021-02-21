import 'package:flutter/material.dart';

import 'iconfont.dart';

class CategoryIcon extends StatelessWidget {
  Color color;
  String iconName;
  double size;

  CategoryIcon({this.color, this.iconName, this.size = 30});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
          color: this.color,
          padding: EdgeInsets.all(10),
          child: IconFont(
              color: Colors.white, iconName: this.iconName, size: this.size)),
    );
  }
}
