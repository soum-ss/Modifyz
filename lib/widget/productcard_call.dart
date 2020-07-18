import 'package:modifyz/models/bookpen.dart';
import 'package:modifyz/widget/product_card.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';


class Productcall extends StatefulWidget {
  @override
  _ProductcallState createState() => _ProductcallState();
}

class _ProductcallState extends State<Productcall> {
  @override
  Widget build(BuildContext context) {
    final product2=Provider.of<List<book>>(context);

    return Container(
        height: 230,

        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: product2.length,
            itemBuilder: (context, index) {
              return ProductCard(
                  pro: product2[index]


              );
            }));

  }
}
