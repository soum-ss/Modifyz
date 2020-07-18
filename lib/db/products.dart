import 'dart:async';
import 'dart:ui';
import 'package:modifyz/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';



class ProductsService{
  final CollectionReference productcollection = Firestore.instance.collection('products');
  final CollectionReference bookcoll = Firestore.instance.collection('User');

  var id = Uuid();


// product list from snapshot
   List<Product> _productListFromSnapshot(QuerySnapshot snapshot){
     return snapshot.documents.map((doc) {
       return Product(
         name: doc.data['name']?? '',
          price: doc.data['price']   ?? 0,
         phone: doc.data['phonenumber']??'',
        id: doc.data['id']??'',
      gender: doc.data['gender']??'',
           seat: doc.data['seat']?? 0,
           wifi : doc.data['wifi']??'',
           headmassage:  doc.data['headmassage']??false,
           haircut : doc.data['haircut']??false,
           hairc: doc.data['hairc']??'',
           Cashless: doc.data['Cashless']??false,
           ac:  doc.data['ac']??false,
           address: doc.data['address']??'',
           beard : doc.data['beard']??false,
           beardprice: doc.data['beardprice']??'',
           bike: doc.data['bike']??false,
           car: doc.data['car']??false,
           experience: doc.data['experience']??'',
           facial: doc.data['facial']??'',
           haircolprice: doc.data['haircolprice']??'',
           haircutprice: doc.data['haircutprice']??'',
           headmass: doc.data['headmass']??'',
           facialp: doc.data['facialp']??','
       );
     }).toList();

   }
  //get product stream
  Stream<List<Product>> get products{
    return productcollection.snapshots()
        .map(_productListFromSnapshot);
  }

  void uploadProduct(Map<String, dynamic> data,x,y) {
    String productId = id.v1();
    data["id"] = productId;
    print(x);
    print('y');
    print(y);

    productcollection.document(x).collection('book').document(productId).setData(data);
    bookcoll.document(y).collection('book').document(productId).setData(data);
  }


}






