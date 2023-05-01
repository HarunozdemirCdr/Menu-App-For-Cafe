import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_menu/Routes/routes.dart';

import '../Gradient_background/Gradient_Background.dart';
import '../Models/Category_model_horizontal.dart';
import '../Models/Product_model.dart';

class menu_product_page extends StatefulWidget {
  const menu_product_page({Key? key, required this.selectedCategory}) : super(key: key);
   final String selectedCategory;
  @override
  State<menu_product_page> createState() => _menu_product_pageState();
}

class _menu_product_pageState extends State<menu_product_page> {


  final productRef = FirebaseFirestore.instance.collection('products');
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration:Gradient_Background(),


        //ARKA PLAN KISMI

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height/15,),

            Container(
              height: height/15,
              child: IconButton(
                icon: Icon(Icons.chevron_left,size: 35),
                onPressed: () {
                  Route_Screen().Menu_Category_Page(context);
                },
              ),

            ),

            SizedBox(height: height/60,),

            Category_model(height, width),


            Container(height: height/27,width:width*0.75,alignment:Alignment.center,
              margin: EdgeInsets.only(bottom: height/95),
              color: Colors.transparent,
              child: Text(widget.selectedCategory.toString(),style: TextStyle(
                  color: Colors.white,fontSize: 30
              )),),

            // ÜRÜNLERİN OLDUĞU KISIMLAR (BEYAZ İLE OLAN BÖLÜM)

            Expanded(

                child: FutureBuilder<QuerySnapshot>(
    future: productRef.where('category', isEqualTo: widget.selectedCategory).get(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasError) {
    return Center(child: Text('Bir şeyler yanlış gitti!'));
    }
    if (snapshot.connectionState == ConnectionState.waiting) {
    return Center(child: CircularProgressIndicator());
    }

    final List<Map<String, dynamic>> products = snapshot.data!.docs.map((DocumentSnapshot doc) {
    return {
    'name': doc['name'],
    'price': doc['price'],
    'category': doc['category'],
      'description': doc['description'],
      'time': doc['time'],
    };
    }).toList();

    if (products.isEmpty) {
      Text('Seçili kategoride ürün bulunamadı.');
    } else {
      // ürünleri listeleyin veya işlemleri yapın
    }

    return GridView.builder(
                    itemCount: products.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, mainAxisSpacing: 15,mainAxisExtent: 109
                ), itemBuilder: (BuildContext context,int index){
                  return Product_Model(height, products, index);;

                }  );}),

            )],),),
    );
  }



}
