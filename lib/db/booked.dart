import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modifyz/models/bookpen.dart';


class BookingServices{
  final CollectionReference bookcoll = Firestore.instance.collection('User');
  final String uid;
  BookingServices({ this.uid });


  List<book> _productListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc) {
      return book(
          haircolor: doc.data['haircolor']?? '',
          beard: doc.data['beard']   ?? 0,
          haircut: doc.data['haircut']??'',
          facial: doc.data['facial']??'',
          headmassage: doc.data['headmassage']??'',
          total: doc.data['total']?? '',
          time : doc.data['time']??'',
          date:  doc.data['date']??false,

      );
    }).toList();

  }

  Stream<List<book>> get books{
    return bookcoll.document(uid).collection('book').snapshots()
        .map(_productListFromSnapshot);
  }

}