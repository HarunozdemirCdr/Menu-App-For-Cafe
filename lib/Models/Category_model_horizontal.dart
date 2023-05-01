import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_menu/Routes/routes.dart';

final categoryRef = FirebaseFirestore.instance.collection('category');

Container Category_model(double height, double width) {
  return Container(
    height: height/4.5,
    color: Colors.transparent,
    child: Row(
      children: [


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
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 5,
                  mainAxisExtent: 150,

                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        GestureDetector(

                          child: Container(
                            margin: EdgeInsets.all(10),
                            width: width/2,
                            height: height/7,
                            child: FittedBox(
                              child: Image.asset(categories[index]['image'],),
                              fit: BoxFit.fill,
                            ),
                          ),
                          onTap: () {
                          Route_Screen().Menu_Product_Page(categories[index]["name"], context);
                          },
                        ),
                        SizedBox(height: height/120,),
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

                },
              );
            },
          ),
        ),
      ],
    ),

  );
}