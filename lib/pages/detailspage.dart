import 'package:flutter/material.dart';
import 'package:orilla_fresca_app/helpers/appcolors.dart';
import 'package:orilla_fresca_app/models/subcategory.dart';
import 'package:orilla_fresca_app/widgets/categoryicon.dart';
import 'package:orilla_fresca_app/widgets/categorypartslist.dart';
import 'package:orilla_fresca_app/widgets/mainappbar.dart';
import 'package:orilla_fresca_app/widgets/themebutton.dart';
import 'package:orilla_fresca_app/widgets/unitpricewidget.dart';
import 'package:orilla_fresca_app/helpers/utils.dart';

import 'mappage.dart';

class DetailsPage extends StatefulWidget {

  SubCategory subCategory;
  DetailsPage({ this.subCategory });

  @override 
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> {

  @override
  Widget build(BuildContext context) {
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
                        image: AssetImage('assets/imgs/' + widget.subCategory.imgName + '_desc.png'),
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
                            color: widget.subCategory.color,
                            iconName: widget.subCategory.icon,
                            size: 50
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(widget.subCategory.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20
                                )
                              ),
                              SizedBox(height: 10),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: widget.subCategory.color,
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Text('\$${widget.subCategory.price.toStringAsFixed(2)} / ${Utils.weightUnitToString(widget.subCategory.unit)}',
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
                  Positioned(
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
                          Text('3',
                            style: TextStyle(
                              color: Colors.white, fontSize: 15
                            )
                          ),
                          Icon(Icons.shopping_cart, color: Colors.white, size: 15)
                        ],
                      )
                    )
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
                      Visibility(
                        visible: widget.subCategory.parts.length > 0,
                        child: CategoryPartsList(
                          subCategory: widget.subCategory
                        ),
                      ),
                      UnitPriceWidget(
                        themeColor: widget.subCategory.color,
                        price: widget.subCategory.price,
                        unit: widget.subCategory.unit,
                      ),
                      ThemeButton(
                        label: 'Añadir al Carrito',
                        icon: Icon(Icons.shopping_cart, color: Colors.white),
                        onClick: () {},
                      ),
                      ThemeButton(
                        label: 'Locación del Producto',
                        icon: Icon(Icons.location_pin, color: Colors.white),
                        onClick: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => 
                              MapPage(subCategory: widget.subCategory))
                          );
                        },
                        color: AppColors.DARK_GREEN,
                        highlight: AppColors.DARKER_GREEN,
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