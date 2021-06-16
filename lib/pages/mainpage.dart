import 'package:flutter/material.dart';
import 'package:orilla_fresca_app/helpers/utils.dart';
import 'package:orilla_fresca_app/pages/categorylistpage.dart';
import 'package:orilla_fresca_app/pages/favoritespage.dart';
import 'package:orilla_fresca_app/pages/settingspage.dart';
import 'package:orilla_fresca_app/pages/shoppinglistpage.dart';
import 'package:orilla_fresca_app/services/cartservice.dart';
import 'package:orilla_fresca_app/widgets/categorybottombar.dart';
import 'package:orilla_fresca_app/widgets/mainappbar.dart';
import 'package:orilla_fresca_app/widgets/sidemenubar.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {

  @override 
  Widget build(BuildContext context) {

    CartService cartService = Provider.of<CartService>(context, listen: false);
    cartService.loadCartItemsFromFirebase(context);

    return Scaffold(
      drawer: Drawer(
        child: SideMenuBar()
      ),
      appBar: MainAppBar(),
      body: Container(
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Navigator(
                    key: Utils.mainListNav,
                    initialRoute: '/',
                    onGenerateRoute: (RouteSettings settings) {

                      Widget page;

                      switch(settings.name) {
                        case '/':
                          page = CategoryListPage();
                          break;
                        case '/mainpage/favoritespage':
                          page = FavoritesPage();
                          break;
                        case '/mainpage/shoppinglistpage':
                          page = ShoppingListPage();
                          break;
                        case '/mainpage/settingspage':
                          page = SettingsPage();
                          break;
                        default:
                          page = CategoryListPage();
                          break;
                      }

                      return PageRouteBuilder(
                        pageBuilder: (_, __, ___) => page,
                        transitionDuration: const Duration(seconds: 0)
                      );
                    },
                  )
                ),
                CategoryBottomBar()
              ],
            )
      )
    );
  }
}