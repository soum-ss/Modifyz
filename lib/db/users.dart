import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modifyz/models/currentuser.dart';
import 'package:firebase_auth/firebase_auth.dart';



class UserServices{
  final String uid;
  FirebaseAuth _auth= FirebaseAuth.instance;
  UserServices({ this.uid });




  final CollectionReference user = Firestore.instance.collection('User');
  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {

    return UserData(
      id:snapshot.data['id'],
        name: snapshot.data['name'],
        email: snapshot.data['email'],
        gender: snapshot.data['gender']
    );

  }
  Future<void> updateUserData(String email, String name,String gender,String pin) async {
    return await user.document(uid).setData({
      'name': name,
      'email': email,
      'gender':gender,
      'pin': pin,
    });
  }

  Stream<UserData> get userData {

    return user.document(uid).snapshots()
        .map(_userDataFromSnapshot);
  }



}