import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_the_cart =[
    {
      "name": "shop 1",
      "picture": "images/products/blazer1.jpeg",
      "quantity":1,
      "price": 50,
    },
    {
      "name": "shop2",
      "picture": "images/products/dress1.jpeg",
      "quantity":1,
      "price": 50,

    },

  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index){
          return Single_cart_product(
            cart_prod_name: Products_on_the_cart[index]["name"],
            cart_prod_pricture: Products_on_the_cart[index]["picture"],
            cart_product_quantity: Products_on_the_cart[index]["quantity"],
            cart_prod_price: Products_on_the_cart[index]["price"],

          );
        });
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_pricture;
  final cart_product_quantity;

  final cart_prod_price;

  Single_cart_product({Key key,this.cart_product_quantity, this.cart_prod_name, this.cart_prod_pricture,  this.cart_prod_price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        //   =======leading
        leading: new Image.asset(cart_prod_pricture,width: 60.0,height: 100.0,
        ),

        //=====title
        title: new Text(cart_prod_name),

        //======subtitle
        subtitle: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(8.0),
                  child: new Text('price'), ),
                Padding(padding: EdgeInsets.all(8.0),
                  child: new Text("${cart_prod_price}"), ),


                Padding(padding: EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: new Text('price'), ),
                Padding(padding: EdgeInsets.all(8.0),
                  child: new Text("${cart_prod_price}"), )

              ],
            ),
            new Container(
              alignment: Alignment.topLeft,
              child: new Text("${cart_prod_price}",style: TextStyle(fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red
              ),

              ),
            )
          ],
        ),



      ),
    );
  }
}

