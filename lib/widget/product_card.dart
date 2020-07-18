import 'package:flutter/material.dart';
import 'package:modifyz/models/bookpen.dart';

class ProductCard extends StatelessWidget {
  final book pro;
  ProductCard({this.pro});



  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            /*child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "images/m2.jpg",
                height: 90,
                width: 70,
                fit: BoxFit.cover,
              ),
            ),*/
          ),

          SizedBox(width: 10,),

          RichText(text: TextSpan(
              children: [
                TextSpan(text: pro.date, style: TextStyle(fontSize: 20),),
                TextSpan(text: 'by: $pro.time \n', style: TextStyle(fontSize: 16, color: Colors.grey),),

                TextSpan(text: pro.total, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),


              ], style: TextStyle(color: Colors.black)
          ),)
        ],
      ),
    );
  }
}