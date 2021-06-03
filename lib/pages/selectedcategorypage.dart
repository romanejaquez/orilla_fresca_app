import 'package:flutter/material.dart';
import 'package:orilla_fresca_app/helpers/utils.dart';
import 'package:orilla_fresca_app/models/category.dart';
import 'package:orilla_fresca_app/models/subcategory.dart';
import 'package:orilla_fresca_app/services/cartservice.dart';
import 'package:orilla_fresca_app/services/categoryselectionservice.dart';
import 'package:orilla_fresca_app/widgets/categoryicon.dart';
import 'package:orilla_fresca_app/widgets/mainappbar.dart';
import 'package:provider/provider.dart';

class SelectedCategoryPage extends StatelessWidget {

  Category? selectedCategory;

  @override
  Widget build(BuildContext context) {

    CategorySelectionService catSelection = Provider.of<CategorySelectionService>(context, listen: false);
    selectedCategory = catSelection.selectedCategory;
    CartService cartService = Provider.of<CartService>(context, listen: false);
    
    return Scaffold(
      appBar: MainAppBar(),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CategoryIcon(
                  color: this.selectedCategory!.color,
                  iconName: this.selectedCategory!.icon
                ),
                SizedBox(width: 10),
                Text(this.selectedCategory!.name!,
                  style: TextStyle(color: this.selectedCategory!.color, fontSize: 20)
                )
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                  this.selectedCategory!.subCategories!.length,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        var subCat = this.selectedCategory!.subCategories![index];
                        catSelection.selectedSubCategory = cartService.getCategoryFromCart(subCat as SubCategory);
                        Utils.mainAppNav.currentState!.pushNamed('/detailspage');
                      },
                      child: Container(
                        child: Column(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                'assets/imgs/' + this.selectedCategory!.subCategories![index].imgName! + '.png',
                                fit: BoxFit.cover, width: 100, height: 100
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(this.selectedCategory!.subCategories![index].name!,
                              style: TextStyle(color: this.selectedCategory!.color
                            ))
                          ],
                        )
                      ),
                    );
                  }
                ),
              ),
            )
          ],
        )
      )
    );
  }
}