import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qr_code_menu/Routes/routes.dart';

import '../Gradient_background/Gradient_Background.dart';
import 'Menu_Product_Page.dart';
import '../Models/Category_model_vertical.dart';

class menu_category_page extends StatefulWidget {
  const menu_category_page({Key? key}) : super(key: key);

  @override
  State<menu_category_page> createState() => _menu_category_pageState();
}

class _menu_category_pageState extends State<menu_category_page> {
  final categoryRef = FirebaseFirestore.instance.collection('category');
  late String selectedCategory = "";
  @override

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: Gradient_Background(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              height: height/20,

              child: IconButton(
                icon: Icon(Icons.chevron_left,size: 35),
                onPressed: () {
                  Route_Screen().Welcome_Page(selectedCategory, context);
                },
              ),

            ),
            Expanded(
              child: FutureBuilder<QuerySnapshot>(
                future: categoryRef.get(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Bir şeyler yanlış gitti!'));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final List<Map<String, dynamic>> categories = snapshot.data!.docs.map((DocumentSnapshot doc) {
                    return {
                      'name': doc['name'],
                      'image': doc['image'],
                    };
                  }).toList();

                  return GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: categories.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 33,
                      mainAxisExtent: 310,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return category_model_vertical(selectedCategory,width, height, categories, index, context,);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


}
