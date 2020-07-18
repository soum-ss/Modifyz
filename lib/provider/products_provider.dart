import 'package:flutter/material.dart';
import 'package:modifyz/models/product.dart';
import 'package:modifyz/db/products.dart';



class ProductsProvider with ChangeNotifier{
  List<Product> productsList = [];
  ProductsService _productsServices = ProductsService();

  ProductsProvider(){
    loadProducts();
  }
  Future loadProducts()async{
    //productsList = await _productsServices.getProducts();
    notifyListeners();
  }
}