

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'featured_card.dart';
import 'package:modifyz/provider/products_provider.dart';
import 'package:modifyz/db/products.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modifyz/models/product.dart';

class FeaturedProducts extends StatefulWidget {
  @override
  _FeaturedProductsState createState() => _FeaturedProductsState();
}

class _FeaturedProductsState extends State<FeaturedProducts> {



  @override
  Widget build(BuildContext context) {
    final product2=Provider.of<List<Product>>(context);

    return Container(
        height: 230,

        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: product2.length,
            itemBuilder: (context, index) {
              return FeaturedCard(
                pro: product2[index]


              );
            }));
  }
}
