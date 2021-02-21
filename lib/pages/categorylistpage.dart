import 'package:flutter/material.dart';
import 'package:orilla_fresca_app/helpers/appcolors.dart';
import 'package:orilla_fresca_app/helpers/iconhelper.dart';
import 'package:orilla_fresca_app/helpers/utils.dart';
import 'package:orilla_fresca_app/models/category.dart';
import 'package:orilla_fresca_app/pages/selectedcategorypage.dart';
import 'package:orilla_fresca_app/widgets/categorybottombar.dart';
import 'package:orilla_fresca_app/widgets/categorycard.dart';
import 'package:orilla_fresca_app/widgets/iconfont.dart';
import 'package:orilla_fresca_app/widgets/mainappbar.dart';

class CategoryListPage extends StatelessWidget {

  List<Category> categories = Utils.getMockedCategories();

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: MainAppBar(),
      body: Container(
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text('Seleccione una categoría:',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black)
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return CategoryCard(
                        category: categories[index],
                        onCardClick: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SelectedCategoryPage(
                                selectedCategory: this.categories[index],
                              )
                            )
                          );
                        }
                      );
                    },
                  ),
                ),
                CategoryBottomBar()
              ],
            )
      )
    );
  }
}