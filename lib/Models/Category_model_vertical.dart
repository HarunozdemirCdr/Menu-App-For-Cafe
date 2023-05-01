import 'package:flutter/material.dart';
import 'package:qr_code_menu/Routes/routes.dart';


Container category_model_vertical(selectedCategory,double width, double height, List<Map<String, dynamic>> categories, int index, BuildContext context) {
  return Container(
    color: Colors.transparent,
    child: Column(
      children: [
        GestureDetector(
          child: Container(
            margin: EdgeInsets.all(10),
            width: width/2.5,
            height: height/4,
            child: FittedBox(
              child: Image.asset(categories[index]['image'],),
              fit: BoxFit.fill,
            ),
          ),
          onTap: () {
            selectedCategory = categories[index]['name'];
            Route_Screen().Menu_Product_Page(selectedCategory, context);
          },
        ),
        SizedBox(height: height/100,),
        Text(
          categories[index]['name'],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}