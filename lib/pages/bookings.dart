import 'package:flutter/material.dart';
import 'package:modifyz/db/booked.dart';
import 'package:modifyz/models/bookpen.dart';
import 'package:modifyz/models/currentuser.dart';
import 'package:provider/provider.dart';
import 'package:modifyz/widget/productcard_call.dart';

class Booking extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return StreamProvider<List<book>>.value(
        value: BookingServices(uid: user.uid).books,
        child: Scaffold(
          body: SafeArea(child: ListView(
            children: <Widget>[
              SizedBox(height: 20),
              Productcall(),
            ],
            
          ),
          


        )));

  }
}
