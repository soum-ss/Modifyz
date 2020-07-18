import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class User {

  final String uid;

  User({ this.uid });

}

class UserData {

  final String id;
  final String name;
  final String email;
  final String gender;

  UserData({ this.id, this.email, this.gender, this.name });

}