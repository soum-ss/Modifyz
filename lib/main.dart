import 'package:flutter/material.dart';
import 'package:modifyz/models/currentuser.dart';
import 'package:modifyz/pages/login.dart';
import 'package:modifyz/pages/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:modifyz/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:modifyz/pages/login.dart';
import 'package:modifyz/provider/products_provider.dart';
import 'package:modifyz/pages/home.dart';
import 'package:modifyz/pages/splash.dart';
import 'models/product.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
