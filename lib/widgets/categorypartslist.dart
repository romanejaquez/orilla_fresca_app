import 'package:flutter/material.dart';
import 'package:orilla_fresca_app/models/categorypart.dart';
import 'package:orilla_fresca_app/models/subcategory.dart';

class CategoryPartsList extends StatefulWidget {

  SubCategory? subCategory;

  CategoryPartsList({ this.subCategory });
  
  @override 
  CategoryPartsListState createState() => CategoryPartsListState();
}

class CategoryPartsListState extends State<CategoryPartsList> {

  @override 
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Text('Seleccione la parte que desea:'),
        ),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.subCategory!.parts.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    widget.subCategory!.parts.forEach((CategoryPart part) {
                      part.isSelected = widget.subCategory!.parts[index] == part;
                    });
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(15),
                      width: 120,
                      height: 150,
                      decoration: BoxDecoration(
                        border: widget.subCategory!.parts[index].isSelected! ?
                          Border.all(color: widget.subCategory!.color!, width: 7)
                          : null,
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: AssetImage('assets/imgs/' + 
                            widget.subCategory!.parts[index].imgName! + '.png'
                          ), fit: BoxFit.cover
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset.zero,
                            blurRadius: 10
                          )
                        ]
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25),
                      child: Text(widget.subCategory!.parts[index].name!,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: widget.subCategory!.color)
                      )
                    )
                  ],
                )
              );
            },
          )
        )
      ],
    );
  }
}