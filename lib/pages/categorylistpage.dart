import 'package:flutter/material.dart';
import 'package:orilla_fresca_app/helpers/utils.dart';
import 'package:orilla_fresca_app/models/category.dart';
import 'package:orilla_fresca_app/services/categoryselectionservice.dart';
import 'package:orilla_fresca_app/services/categoryservice.dart';
import 'package:orilla_fresca_app/widgets/categorycard.dart';
import 'package:provider/provider.dart';

class CategoryListPage extends StatelessWidget {

  @override 
  Widget build(BuildContext context) {

    CategorySelectionService catSelection = Provider.of<CategorySelectionService>(context, listen: false);
    CategoryService catService = Provider.of<CategoryService>(context, listen: false);
    List<Category> categories = catService.getCategories();
    
    return Column(
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
                  catSelection.selectedCategory = categories[index];
                  Utils.mainAppNav.currentState!.pushNamed('/selectedcategorypage');
                }
              );
            },
          ),
        )
      ]
    );
  }
}