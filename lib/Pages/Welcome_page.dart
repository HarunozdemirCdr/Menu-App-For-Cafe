import 'package:flutter/material.dart';
import 'package:qr_code_menu/Routes/routes.dart';
import '../Gradient_background/Gradient_Background.dart';


class welcome_page extends StatefulWidget {
  const welcome_page({Key? key}) : super(key: key);

  @override
  State<welcome_page> createState() => _welcome_pageState();
}

class _welcome_pageState extends State<welcome_page> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(

        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: height,
            width: width,
            decoration:Gradient_Background(),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [Container(


                margin: EdgeInsets.only(top: height/15),
                height: height/8,

                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("HOŞGELDİNİZ ! ",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold,fontFamily: "Helix"),)
                  ],
                ),

              ),
                SizedBox(height: height/24,),
                Container(width: width*0.7, height: height/2,child: Image.asset("assets/firmalogosu.png"),decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.black)),
                SizedBox(height: height/10),
                GestureDetector(  onTap: () {
                  Route_Screen().Menu_Category_Page(context);
                },
                    child: Container(height: height/13,width: width*0.8,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.black,),
                        child:Row(mainAxisAlignment:MainAxisAlignment.center,children: [
                          Text("MENÜ",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                        ],) ) ),
                SizedBox(height: height/30,),



              ],
            ),
          ),
          scrollDirection: Axis.vertical,
        ));
  }
}
