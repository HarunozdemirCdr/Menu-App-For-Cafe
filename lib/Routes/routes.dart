import 'package:flutter/material.dart';
import 'package:qr_code_menu/Pages/Menu_Product_Page.dart';
import 'package:qr_code_menu/Pages/Welcome_page.dart';

import '../Pages/Menu_Category_Page.dart';

class Route_Screen {

  Menu_Category_Page(BuildContext context){

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => menu_category_page(),
      ),
    );


  }

  Menu_Product_Page(selectedCategory,BuildContext context){

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => menu_product_page(selectedCategory: selectedCategory),
      ),
    );


  }


  Welcome_Page(selectedCategory,BuildContext context){

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => welcome_page(),
      ),
    );


  }



}