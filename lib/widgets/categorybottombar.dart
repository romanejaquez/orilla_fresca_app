import 'package:flutter/material.dart';
import 'package:orilla_fresca_app/helpers/appcolors.dart';
import 'package:orilla_fresca_app/helpers/utils.dart';
import 'package:orilla_fresca_app/services/cartservice.dart';
import 'package:provider/provider.dart';

class CategoryBottomBar extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(0.2),
              offset: Offset.zero)
        ]),
        height: 100,
        padding: EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipOval(
              child: Material(
                color: Colors.white,
                child: IconButton(
                  splashColor: Colors.grey[100],
                  highlightColor: Colors.grey[100],
                  icon: Icon(Icons.list, color: AppColors.MAIN_COLOR),
                  onPressed: () {
                    Utils.mainListNav.currentState!.pushReplacementNamed('/mainpage/categorylistpage');
                  },
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Material(
                color: Colors.white,
                child: InkWell(
                  splashColor: Colors.grey[100],
                  highlightColor: Colors.grey[100],
                  onTap: () {
                    Utils.mainListNav.currentState!.pushReplacementNamed('/mainpage/shoppinglistpage');
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    child: Consumer<CartService>(
                      builder: (context, cart, child) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_cart, color: AppColors.MAIN_COLOR),
                            Visibility(
                              visible: cart.items.length > 0,
                              child: Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text(cart.items.length.toString(),
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.MAIN_COLOR)
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    )
                  )
                )
              )
            ),
            ClipOval(
              child: Material(
                color: Colors.white,
                child: IconButton(
                  splashColor: Colors.grey[100],
                  highlightColor: Colors.grey[100],
                  icon: Icon(Icons.favorite, color: AppColors.MAIN_COLOR),
                  onPressed: () {
                    Utils.mainListNav.currentState!.pushReplacementNamed('/mainpage/favoritespage');
                  },
                ),
              ),
            ),
            ClipOval(
              child: Material(
                color: Colors.white,
                child: IconButton(
                  splashColor: Colors.grey[100],
                  highlightColor: Colors.grey[100],
                  icon: Icon(Icons.settings, color: AppColors.MAIN_COLOR),
                  onPressed: () {
                    Utils.mainListNav.currentState!.pushReplacementNamed('/mainpage/settingspage');
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
