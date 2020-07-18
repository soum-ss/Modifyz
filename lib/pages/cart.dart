
import 'package:flutter/material.dart';
import 'package:modifyz/pages/home.dart';
import 'package:modifyz/components/cart_products.dart';
import 'package:modifyz/models/product.dart';
import 'package:modifyz/db/products.dart';
import 'package:modifyz/models/currentuser.dart';
import 'package:provider/provider.dart';
import 'package:modifyz/db/users.dart';


class Cart extends StatefulWidget {
  final Product prodet;
  final String date;
  final String time;
  List value;
  Cart({Key key,@required this.value,this.prodet,this.date,this.time}) : super(key:key);

  @override
  _CartState createState() => _CartState(value: value,prodet1: prodet,date:date,time: time  );
}

class _CartState extends State<Cart> {
  ProductsService productService = ProductsService();

  String total;
  final String date;
  final String time;
  List value;
  final Product prodet1;

 String v;

  _CartState({this.value,this.prodet1,this.date,this.time});

  set isLoading(bool isLoading) {}
  @override
  Widget build(BuildContext context) {
    bill();
    User user = Provider.of<User>(context);


    return StreamBuilder<UserData>(
      stream: UserServices(uid: user.uid).userData,
      builder: (context, snapshot)
    {if(snapshot.hasData){
      UserData userData= snapshot.data;
      v=user.uid;

      return Scaffold(
        body:
            Container(
           child: ListView(
             children: <Widget>[
               SizedBox(height: 21),
               Text('Total Bill',style: TextStyle(
                   color: Colors.black54, fontSize: 60.0)),

               Card(
                child: Row(
                 children: <Widget>[

                   Text('Haircut',style: TextStyle(
                       color: Colors.red, fontSize: 25.0)),
                   SizedBox(width: 117),
                   Opacity(
                     opacity: value[0] ? 1.0 : 0.0,
                     child: const Text("Selected",style: TextStyle(
                         color: Colors.red, fontSize: 20.0)),
                   ),
                   SizedBox(width: 70),
                   Text(prodet1.haircutprice,style: TextStyle(
                       color: Colors.red, fontSize: 25.0)),

                 ],
               )
               ),
               Card(
                   child: Row(
                     children: <Widget>[

                       Text('Beard',style: TextStyle(
                           color: Colors.red, fontSize: 25.0)),
                       SizedBox(width: 132),
                       Opacity(
                         opacity: value[1] ? 1.0 : 0.0,
                         child: const Text("Selected",style: TextStyle(
                             color: Colors.red, fontSize: 20.0)),
                       ),
                       SizedBox(width: 72),
                       Text(prodet1.beardprice,style: TextStyle(
                           color: Colors.red, fontSize: 25.0)),

                     ],
                   )
               ),
               Card(
                   child: Row(
                     children: <Widget>[

                       Text('Head Massage',style: TextStyle(
                           color: Colors.red, fontSize: 25.0)),
                       SizedBox(width: 30),
                       Opacity(
                         opacity: value[2] ? 1.0 : 0.0,
                         child: const Text("Selected",style: TextStyle(
                             color: Colors.red, fontSize: 20.0)),
                       ),
                       SizedBox(width: 70),
                       Text(prodet1.headmass,style: TextStyle(
                           color: Colors.red, fontSize: 25.0)),

                     ],
                   )
               ),
               Card(
                   child: Row(
                     children: <Widget>[

                       Text('Facial',style: TextStyle(
                           color: Colors.red, fontSize: 25.0)),
                       SizedBox(width: 131),
                       Opacity(
                         opacity: value[3] ? 1.0 : 0.0,
                         child: const Text("Selected",style: TextStyle(
                             color: Colors.red, fontSize: 20.0)),
                       ),
                       SizedBox(width: 70),
                       Text(prodet1.facialp,style: TextStyle(
                           color: Colors.red, fontSize: 25.0)),

                     ],
                   )
               ),
               Card(
                   child: Row(
                     children: <Widget>[

                       Text('Hair Color',style: TextStyle(
                           color: Colors.red, fontSize: 25.0)),
                       SizedBox(width: 85),
                       Opacity(
                         opacity: value[4] ? 1.0 : 0.0,
                         child: const Text("Selected",style: TextStyle(
                             color: Colors.red, fontSize: 20.0)),
                       ),
                       SizedBox(width: 70),
                       Text(prodet1.haircolprice,style: TextStyle(
                           color: Colors.red, fontSize: 25.0)),

                     ],
                   )
               ),
               SizedBox(height: 70),


               Card(
                   child: Column(
                     children: <Widget>[
                        Row(
                         children: <Widget>[

                           Text('Username',style: TextStyle(
                               color: Colors.red, fontSize: 25.0)),
                           SizedBox(width: 85),

                           Text(userData.name,style: TextStyle(
                               color: Colors.red, fontSize: 25.0)),
                           SizedBox(width: 70),


                         ],
                       ),
                       Row(
                         children: <Widget>[

                           Text('Shopname',style: TextStyle(
                               color: Colors.red, fontSize: 25.0)),
                           SizedBox(width: 85),

                           Text(prodet1.name,style: TextStyle(
                               color: Colors.red, fontSize: 25.0)),
                           SizedBox(width: 70),

                         ],
                       )

                     ],
                   ),
               ),

             ],
           ),
            ),



        bottomNavigationBar: new Container(
          color: Colors.white,

          child: Row(
            children: <Widget>[
              Expanded(
                  child: ListTile(
                    title: new Text('Totals'),
                    subtitle: new Text(total),

                  )),
              Expanded(child: new MaterialButton(onPressed: () {
                validateAndUpload();
              },
                child: new Text(
                  'checkout', style: TextStyle(color: Colors.white),),
                color: Colors.red,
              ),

              ),
            ],
          ),

        ),

      );
    }else{

    }
  }
    );
  }

  void bill() {
    int x=0;

    print(prodet1.name);
    var haircuut = int.parse(prodet1.haircutprice);
    var beard = int.parse(prodet1.beardprice);
    var facial = int.parse(prodet1.facialp);
    var headmassage = int.parse(prodet1.headmass);
    var haircol = int.parse(prodet1.haircolprice);
    if(value[0]==true){
      x=x+haircuut;
    }
    if(value[1]==true){
      x=x+beard;
    }
    if(value[2]==true){
      x=x+headmassage;
    }
    if(value[3]==true){
      x=x+facial;
    }
    if(value[4]==true){
      x=x+haircol;
    }
    total=x.toString();


  }
  void validateAndUpload() async{
    setState(() => isLoading = true);

    productService.uploadProduct({
        "haircut":value[0],
        "beard":value[1],
        "headmassage":value[2],
        "facial":value[3],
        "haircolor":value[4],
        "date":date,
        "time":time,
        "total":total,

      },prodet1.id,v);
    Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
    }
}
