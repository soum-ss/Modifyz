import 'package:flutter/material.dart';
import 'package:modifyz/pages/product_details.dart';
import 'package:modifyz/models/product.dart';

class FeaturedCard extends StatelessWidget {

  final Product pro;
  FeaturedCard({this.pro});

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: EdgeInsets.all(4),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=> ProductDetails(prodet: pro,)));
        },
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color:
                Color.fromARGB(62, 168, 174, 201),
                offset: Offset(0, 9),
                blurRadius: 14,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  "images/cut1.jfif",
                  height: 220,
                  width: 200,
                  fit: BoxFit.cover,
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: 100,
                      width: 200,
                      decoration: BoxDecoration(
                        // Box decoration takes a gradient
                        gradient: LinearGradient(
                          // Where the linear gradient begins and ends
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          // Add one stop for each color. Stops should increase from 0 to 1
                          colors: [
                            // Colors are easy thanks to Flutter's Colors class.
                            Colors.black.withOpacity(0.8),
                            Colors.black.withOpacity(0.7),
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.4),
                            Colors.black.withOpacity(0.1),
                            Colors.black.withOpacity(0.05),
                            Colors.black.withOpacity(0.025),
                          ],
                        ),
                      ),

                      child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(

                          )
                      )),
                ),

                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: RichText(text: TextSpan(children: [
                        TextSpan(text: pro.name, style: TextStyle(fontSize: 18)),
                        TextSpan(text: '\n\$${pro.price.toString()} \n', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      ]))
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}