import 'package:flutter/material.dart';

Container Product_Model(double height, List<Map<String, dynamic>> products, int index) {
  return Container(
      padding: EdgeInsets.only(left: height/20,top: 7),
      height: 102,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,


        children: [

          Stack(children: [Positioned(
              right:7,child:Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(3),color: Colors.transparent,),
              width: 75,height: 20,child: Row(children: [Text(products[index]['time'] + "  dk",style: TextStyle(
                color: Colors.green,fontSize: 18,
              ),),
                Icon(Icons.check,color: Colors.white,),
              ],)) ),
            Row(children: [Text(products[index]['name'],style: TextStyle(
              color: Colors.black,fontSize: 18,
            ),),
            ],),],),


          SizedBox(height: 7,),
          Text(products[index]['description'].toString(),style: TextStyle(fontSize: 10,color: Colors.grey),),
          Divider(color: Colors.grey,height: 3,),
          SizedBox(height: 15,),
          Stack(children: [Row(children: [Text("${products[index]["price"]}"" TL",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold,),),],)
            ,Positioned(right: 40,
              child: Container(height: 30,width: 25,
                child: Icon(Icons.fastfood,color: Colors.black,),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)
                  ,color: Colors.transparent,),),

            )],)



        ],
      ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,)
  );
}
