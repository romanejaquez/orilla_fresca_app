import 'package:flutter/material.dart';
import 'package:orilla_fresca_app/models/subcategory.dart';
import 'package:orilla_fresca_app/widgets/mainappbar.dart';

class DetailsPage extends StatelessWidget {

  SubCategory subCategory;

  DetailsPage({ this.subCategory });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Center(
        child: Text(this.subCategory.name)
      )
    );
  }
}