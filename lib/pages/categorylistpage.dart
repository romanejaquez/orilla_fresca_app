import 'package:flutter/material.dart';
import 'package:orilla_fresca_app/helpers/utils.dart';
import 'package:orilla_fresca_app/models/category.dart';
import 'package:orilla_fresca_app/services/categoryselectionservice.dart';
import 'package:orilla_fresca_app/widgets/categorycard.dart';
import 'package:provider/provider.dart';

class CategoryListPage extends StatelessWidget {

  List<Category> categories = Utils.getMockedCategories();

  @override 
  Widget build(BuildContext context) {

    CategorySelectionService catSelection = Provider.of<CategorySelectionService>(context, listen: false);
    
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
                  catSelection.selectedCategory = this.categories[index];
                  Utils.mainAppNav.currentState.pushNamed('/selectedcategorypage');
                }
              );
            },
          ),
        )
      ]
    );
  }
}