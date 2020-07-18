
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:modifyz/models/currentuser.dart';
import 'package:modifyz/pages/bookings.dart';
import 'package:modifyz/pages/cart.dart';
import 'package:modifyz/pages/userdeails.dart';
import 'package:modifyz/provider/user_provider.dart';

import 'package:modifyz/widget/product_card.dart';
import 'package:modifyz/provider/products_provider.dart';
import 'package:provider/provider.dart';
import 'package:modifyz/widget/search.dart';
import 'package:modifyz/widget/featured_products.dart';
//my own imports
import 'package:modifyz/components/horizontal_listview.dart';
import 'package:modifyz/pages/products.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login.dart';
import 'package:modifyz/widget/common.dart';
import 'package:modifyz/db/users.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:modifyz/components/horizontal_listview.dart';
import 'package:modifyz/db/products.dart';
import 'package:modifyz/widget/featured_card.dart';
import 'package:modifyz/models/product.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {





  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool reviewFlag=false;
  var reviews;
  int selectedPage = 0;
  final _pageOptions = [Homy(),Booking(), User_details(), ];
  void onTabTapped(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: User_details(),
        );
      });
    }

    return StreamProvider<List<Product>>.value(
      value: ProductsService().products,
     child: Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red.shade900,
        title: Text('Modifyz'),
        actions: <Widget>[


        ],
      ),

   /*   drawer:
      new Drawer(
        child: new ListView(
          children: <Widget>[
//            header
            new UserAccountsDrawerHeader(

              accountName: Text(''),
              accountEmail: Text(''),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white,),
                ),
              ),
              decoration: new BoxDecoration(
                  color: Colors.red.shade900
              ),
            ),

//            body

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home),
              ),
            ),

            InkWell(
              onTap: (){
                _showSettingsPanel();
              },
              child: ListTile(
                title: Text('My account'),
                leading: Icon(Icons.person),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.shopping_basket),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Categoris'),
                leading: Icon(Icons.dashboard),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(Icons.favorite),
              ),
            ),

            Divider(),

            InkWell(
              onTap: (){
                FirebaseAuth.instance.signOut().then((value){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                });
              },
              child: ListTile(
                title: Text('Log out'),
                leading: Icon(Icons.transit_enterexit, color: Colors.grey,),
              ),
            ),

          ],
        ),
      ),
*/

      body:            _pageOptions[selectedPage],
       bottomNavigationBar: BottomNavigationBar(
         onTap: onTabTapped, // new
         currentIndex: selectedPage, // new
         items: [
           new BottomNavigationBarItem(
             icon: Icon(Icons.home),
             title: Text('Home'),
           ),
           new BottomNavigationBarItem(
             icon: Icon(Icons.calendar_view_day),
             title: Text('Bookings'),
           ),
           new BottomNavigationBarItem(
               icon: Icon(Icons.person),
               title: Text('Profile')
           )
         ],
       ),


     ));

  }

}

class Homy extends StatefulWidget {
  @override
  _HomyState createState() => _HomyState();
}

class _HomyState extends State<Homy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
//          Search Text field
            Search(),
            new Container(
              height: 200.0,
              child:  new Carousel(
                boxFit: BoxFit.cover,
                images: [
                  AssetImage('images/cut1.jfif'),
                  AssetImage('images/cut2.jfif'),
                  AssetImage('images/cut3.jfif'),

                ],
                autoplay: true,
                dotBgColor: Colors.transparent,
                dotSize: 4.0,
                indicatorBgPadding: 2.0,
              ),
            ),

//            featured products
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: new Text('Featured products')),
                ),
              ],
            ),


            FeaturedProducts(),

            //  Text(appProvider.featureProducts.length.toString(), style: TextStyle(color: Colors.black),),
//          recent products
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: new Text('Recent products')),
                ),
              ],
            ),




          ],

        ),

      ),

    );
  }
}


