import 'package:flutter/material.dart';
import 'package:orilla_fresca_app/helpers/appcolors.dart';
import 'package:orilla_fresca_app/helpers/iconhelper.dart';
import 'package:orilla_fresca_app/helpers/utils.dart';
import 'package:orilla_fresca_app/models/cartitem.dart';
import 'package:orilla_fresca_app/models/subcategory.dart';
import 'package:orilla_fresca_app/services/cartservice.dart';
import 'package:orilla_fresca_app/widgets/iconfont.dart';
import 'package:provider/provider.dart';

class ShoppingListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    CartService cartService = Provider.of<CartService>(context, listen: false);

    return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.shopping_cart,
                  color: AppColors.MAIN_COLOR,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Tu Carrito',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize:  25,
                      fontWeight: FontWeight.bold
                    )
                  ),
                ),
                Consumer<CartService>(
                  builder: (context, cart, child) {
                    if (cart.items.length > 0) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Material(
                          child: InkWell(
                            onTap: () {
                              cartService.removeAll(context);
                            },
                            child: Container(
                              padding: EdgeInsets.only(top: 3, bottom: 3, left: 15, right: 15),
                              child: Row(
                                children: [
                                  Icon(Icons.delete, size: 20, color: AppColors.DARK_GREEN),
                                  SizedBox(width: 5),
                                  Text('Borrar Todo',
                                    style: TextStyle(color: AppColors.DARK_GREEN, fontSize: 12)
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.MAIN_COLOR.withOpacity(0.2)
                              )
                            ),
                          ),
                        ),
                      );
                    }

                    // return empty container
                    return Container();
                })
              ],
            ),
            Expanded(
              child: Consumer<CartService>(
                builder: (context, cart, child) {

                  List<Widget> cartItems = [];
                  double mainTotal = 0;

                  if (cart.items.length > 0) {

                    mainTotal = cart.getShoppingCartTotalPrice();
                    
                    cart.items.forEach((CartItem item) {
                      SubCategory itemSubCategory = (item.category as SubCategory);
                      double total = itemSubCategory.getTotalPrice();
                      
                      cartItems.add(
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: Offset.zero
                              )
                            ]
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipOval(
                                child: Image.asset('./assets/imgs/' + itemSubCategory.imgName! + '.png',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(itemSubCategory.name!, 
                                      style: TextStyle(
                                        color: itemSubCategory.color
                                      )
                                    ),
                                    Text('${itemSubCategory.amount.toString()} ${Utils.weightUnitToString(itemSubCategory.unit)} (\$${itemSubCategory.price.toStringAsFixed(2)} per ${Utils.weightUnitToString(itemSubCategory.unit)})', 
                                      style: TextStyle(
                                        color: Colors.grey
                                      )
                                    ),
                                    Text('\$${total.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        color: itemSubCategory.color,
                                        fontWeight: FontWeight.bold
                                      )
                                    )
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  cart.remove(context, item);
                                },
                                icon: Icon(
                                  Icons.highlight_off,
                                  size: 30,
                                  color: AppColors.MAIN_COLOR 
                                )
                              )
                            ],
                          )
                        )
                      );
                    });

                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(height: 20),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: SingleChildScrollView(
                                child: Column(children: cartItems),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconFont(iconName: IconFontHelper.LOGO,
                                  color: AppColors.MAIN_COLOR,
                                  size: 40
                                ),
                                SizedBox(width: 10),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(text: 'Total: \$${mainTotal.toStringAsFixed(2)}',
                                        style: TextStyle(
                                          color: AppColors.MAIN_COLOR,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25
                                        )
                                      )
                                    ]
                                  )
                                )
                              ],
                            )
                          )
                        ],
                      );
                  }
                  else {
                    return Container(
                      alignment: Alignment.center,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconFont(
                              iconName: IconFontHelper.LOGO, 
                              color: Colors.grey[400],
                              size: 30,  
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              width: 2,
                              height: 50,
                              color: Colors.grey[400],
                            ),
                            Text(
                              'Tu carrito no tiene artículos.\nAgrega alguno.',
                              style: TextStyle(color: Colors.grey[400])  
                            )
                          ],
                        ),
                      ),
                    );
                  }
                },
              )
            )
          ]
        )
    );
  }
}