import 'package:flutter/material.dart';
import 'package:orilla_fresca_app/helpers/appcolors.dart';
import 'package:orilla_fresca_app/helpers/iconhelper.dart';
import 'package:orilla_fresca_app/models/cartitem.dart';
import 'package:orilla_fresca_app/models/subcategory.dart';
import 'package:orilla_fresca_app/services/cartservice.dart';
import 'package:orilla_fresca_app/services/categoryselectionservice.dart';
import 'package:orilla_fresca_app/services/loginservice.dart';
import 'package:orilla_fresca_app/widgets/categoryicon.dart';
import 'package:orilla_fresca_app/widgets/categorypartslist.dart';
import 'package:orilla_fresca_app/widgets/iconfont.dart';
import 'package:orilla_fresca_app/widgets/mainappbar.dart';
import 'package:orilla_fresca_app/widgets/themebutton.dart';
import 'package:orilla_fresca_app/widgets/unitpricewidget.dart';
import 'package:orilla_fresca_app/helpers/utils.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {

  SubCategory? subCategory;

  @override 
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> {

  @override
  Widget build(BuildContext context) {

    CategorySelectionService catSelection = Provider.of<CategorySelectionService>(context, listen: false);
    widget.subCategory = catSelection.selectedSubCategory;
    CartService cartService = Provider.of<CartService>(context, listen: false);
    
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
              child: Stack(
                children: [
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/imgs/' + widget.subCategory!.imgName! + '_desc.png'),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.transparent
                          ]
                        )
                      )
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CategoryIcon(
                            color: widget.subCategory!.color,
                            iconName: widget.subCategory!.icon,
                            size: 50
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(widget.subCategory!.name!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20
                                )
                              ),
                              SizedBox(height: 10),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: widget.subCategory!.color,
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Text('\$${widget.subCategory!.price.toStringAsFixed(2)} / ${Utils.weightUnitToString(widget.subCategory!.unit)}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white
                                  )
                                )
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ),
                  Consumer<LoginService>(
                    builder: (context, loginService, child) {

                      if (loginService.isUserLoggedIn()) {
                        return Positioned(
                          right: 20,
                          top: 100,
                          child: Container(
                            padding: EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 8),
                            decoration: BoxDecoration(
                              color: AppColors.MAIN_COLOR,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 20,
                                  offset: Offset.zero
                                )
                              ]
                            ),
                            child: Row(
                              children: [
                                Consumer<CartService>(
                                  builder: (context, cart, child) {
                                    return Text('${cart.items.length}',
                                      style: TextStyle(
                                        color: Colors.white, fontSize: 15
                                      )
                                    );
                                  },
                                ),
                                Icon(Icons.shopping_cart, color: Colors.white, size: 15)
                              ],
                            )
                          )
                        );
                      }

                      // return an empty container instead
                      return Container();
                    },
                  ),
                  MainAppBar(
                    themeColor: Colors.white,
                  )
                ],
              )
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      
                      Consumer<LoginService>(
                        builder: (context, loginService, child) {

                          Widget userActionsWidget;
                          
                          if (loginService.isUserLoggedIn()) {
                            userActionsWidget = Column(
                              children: [
                                Visibility(
                                  visible: widget.subCategory!.parts.length > 0,
                                  child: CategoryPartsList(
                                    subCategory: widget.subCategory
                                  ),
                                ),
                                UnitPriceWidget(),
                                Consumer<CartService>(
                                  builder: (context, cart, child) {
                                    Widget renderedButton;

                                    if (!cart.isSubCategoryAddedToCart(widget.subCategory)) {
                                      renderedButton = ThemeButton(
                                        label: 'Añadir al Carrito',
                                        icon: Icon(Icons.shopping_cart, color: Colors.white),
                                        onClick: () {
                                          cartService.add(
                                            context,
                                            CartItem(category: widget.subCategory)
                                          );
                                        },
                                      );
                                    }
                                    else {
                                      renderedButton = Container(
                                        padding: EdgeInsets.all(26),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('Añadido al Carrito',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.MAIN_COLOR),
                                            ),
                                            SizedBox(width: 10),
                                            Icon(Icons.check_circle, size: 30, color: AppColors.MAIN_COLOR)
                                          ],
                                        ),
                                      );
                                    }

                                    return renderedButton;
                                  },
                                ),
                                ThemeButton(
                                  label: 'Locación del Producto',
                                  icon: Icon(Icons.location_pin, color: Colors.white),
                                  onClick: () {
                                    Utils.mainAppNav.currentState!.pushNamed('/mappage');
                                  },
                                  color: AppColors.DARK_GREEN,
                                  highlight: AppColors.DARKER_GREEN,
                                )
                              ],
                            );
                          }
                          else {
                            userActionsWidget = Container(
                              padding: EdgeInsets.all(50),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconFont(
                                    color: Colors.grey.withOpacity(0.5),
                                    iconName: IconFontHelper.LOGO,
                                    size: 60
                                  ),
                                  SizedBox(height: 20),
                                  Text('Debes estar logeado \n para poder añadir artículos al carrito.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.grey)
                                  ),
                                  SizedBox(height: 20),
                                  ThemeButton(
                                    label: 'Hacer login',
                                    onClick: () async {
                                      // login and fetch the cart info
                                      bool success = await loginService.signInWithGoogle();
                                      if (success) {
                                        CartService cartService = Provider.of<CartService>(context, listen: false);
                                        cartService.loadCartItemsFromFirebase(context);
                                      }
                                    }
                                  )
                                ],
                              ),
                            );
                          }

                          return userActionsWidget;
                        },
                      )
                    ],
                  )
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}