import 'package:flutter/material.dart';
import 'package:orilla_fresca_app/models/subcategory.dart';
import 'package:orilla_fresca_app/services/categoryselectionservice.dart';
import 'package:provider/provider.dart';

import 'categoryicon.dart';

class MapBottomPill extends StatelessWidget {
  
  SubCategory? subCategory;

  @override
  Widget build(BuildContext context) {

    CategorySelectionService catSelection = Provider.of<CategorySelectionService>(context, listen: false);
    this.subCategory = catSelection.selectedSubCategory;
    
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset.zero
          )
        ]
      ),
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipOval(
                      child: Image.asset('assets/imgs/${this.subCategory!.imgName}.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover
                      ),
                    ),
                    Positioned(
                      bottom: -10,
                      right: -10,
                      child: CategoryIcon(
                        color: this.subCategory!.color,
                        iconName: this.subCategory!.icon,
                        size: 20,
                        padding: 5
                      ),
                    )
                  ],
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(this.subCategory!.name!,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                        )
                      ),
                      Text('Venta por Libra'),
                      Text('2km de distancia',
                        style: TextStyle(
                          color: this.subCategory!.color
                        )
                      )
                    ],
                  ),
                ),
                Icon(Icons.location_pin, color: this.subCategory!.color, size: 50)
              ],
            )
          ),
          Container(
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          image: AssetImage('assets/imgs/farmer.jpeg'),
                          fit: BoxFit.cover
                        ),
                        border: Border.all(color: this.subCategory!.color!, width: 4)
                      ),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Jose Gonzalez',
                          style: TextStyle(fontWeight: FontWeight.bold)
                        ),
                        Text('Autopista Duarte\nCarretera Duarte Vieja #225')
                      ],
                    )
                  ],
                )
              ],
            )
          )
        ],
      )
    );
  }
}