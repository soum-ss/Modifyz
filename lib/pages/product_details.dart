import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modifyz/models/product.dart';
import 'package:modifyz/pages/cart.dart';
import 'package:time_range/time_range.dart';


class ProductDetails extends StatefulWidget {
  final Product prodet;
  ProductDetails({this.prodet});
  @override
  _ProductDetailsState createState() => _ProductDetailsState(prodet1: prodet);
}
class Company {
  int id;
  String name;

  Company(this.id, this.name);

  static List<Company> getCompanies() {
    return <Company>[
      Company(1, '08:00'),
      Company(2, '09:00'),
      Company(3, '10:00'),
      Company(4, '11:00'),
      Company(5, '12:00'),
      Company(6, '13:00'),
      Company(7, '14:00'),
      Company(8, '15:00'),
      Company(9, '16:00'),
      Company(10, '17:00'),
      Company(11, '18:00'),
      Company(12, '19:00'),

      Company(13, '20:00'),

    ];
  }
}
class _ProductDetailsState extends State<ProductDetails> {
  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  Company _selectedCompany;


  DateTime _currentdate = new DateTime.now();

  final Product prodet1;
  _ProductDetailsState({this.prodet1});
  bool _haircut = false;
  bool _haircutpress=false;
  bool _beard = false;
  bool _beardpress=false;
  bool _headmass = false;
  bool _headmasspress=false;
  bool _facial = false;
  bool _facialpress=false;
  bool _haircol = false;
  bool _haircolpress=false;
  bool time=true;
  bool etn=true;
  bool ntt=true;
  bool tte=true;
  bool ett=true;
  bool ttt=true;
  bool ttf=true;
  bool ftf=true;
  bool fts=true;
  bool sts=true;
  bool ste=true;
  bool eitn=true;
  bool ntw=true;
  var billing='';
  List<bool> enter= <bool>[];






  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Company>> items = List();
    for (Company company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Company selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  check(){
    if(prodet1.haircut==true){
      setState(() {
        _haircutpress = !_haircutpress;
      });
    }
  }
  check1(){
    if(prodet1.beard==true){
      setState(() {
        _beardpress = !_beardpress;
      });
    }
  }
  check2(){
    if(prodet1.facial==true){
      setState(() {
        _facialpress = !_facialpress;
      });
    }
  }
  check3(){
    if(prodet1.headmassage==true){
      setState(() {
        _headmasspress = !_headmasspress;
      });
    }
  }
  check4(){
    if(prodet1.hairc==true){
      setState(() {
        _haircolpress = !_haircolpress;});
    }

  }
  String date;
  @override
  Widget build(BuildContext context) {
    String _formattedate = new DateFormat.yMMMd().format(_currentdate);
date=_formattedate;


    check();
    check1();
    check2();
    check3();
    check4();


    return Scaffold(

      body: SafeArea(


           child:

                ListView(
              scrollDirection: Axis.vertical,
             children: <Widget>[

                   Image.asset(
                     "images/cut1.jfif",
                     height: 200,
                     fit: BoxFit.cover,
                   ),

                 SizedBox(width: 149),
               Positioned(
                   bottom: 0,
                   child: Container(
                     width: MediaQuery.of(context).size.width,
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: <Widget>[
                         Padding(
                           padding: const EdgeInsets.all(10.0),
                           child: Text(prodet1.name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, letterSpacing: 1,fontSize: 30),),
                         ),


                       ],
                     ),
                   )),
              Card(
                 child: Row(
                   children: <Widget>[
                     Checkbox(
                       value: _haircut,
                       onChanged:prodet1.haircut ? (bool value) {
                         setState(() {
                           _haircut = value;
                           _haircutpress=false;
                           // print(_haircut);
                         });
                         // _haircutpress=!_haircutpress;

                       }   :null,

                     ),

                     Text('Haircut', style: TextStyle(
                         color: Colors.red, fontSize: 20.0),),


                     SizedBox(width: 218),
                     Text(prodet1.haircutprice, style: TextStyle(
                         color: Colors.red, fontSize: 20.0),),


                   ],
                 ),

               ),



                      Row(
                       children: <Widget>[
                         Checkbox(
                           value: _beard,
                           onChanged:prodet1.beard ? (bool value1) {
                             setState(() {
                               _beard = value1;
                          //     _beardpress=false;
                             });

                           }   :null,

                         ),

                         Text('Beard', style: TextStyle(
                             color: Colors.red, fontSize: 20.0),),


                         SizedBox(width: 230),
                         Text(prodet1.beardprice, style: TextStyle(
                             color: Colors.red, fontSize: 20.0),),


                       ],
                     ),



                  Card(

                     child: Row(
                       children: <Widget>[
                         Checkbox(
                           value: _headmass,
                           onChanged:prodet1.headmassage ? (bool value2) {
                             setState(() {
                               _headmass = value2;
                               // print(_haircut);
                               _headmasspress=false;
                             });
                             // _haircutpress=!_haircutpress;

                           }   :null,

                         ),

                         Text('Head massage', style: TextStyle(
                             color: Colors.red, fontSize: 20.0),),


                         SizedBox(width: 170),
                         Text(prodet1.headmass, style: TextStyle(
                             color: Colors.red, fontSize: 20.0),),


                       ],
                     ),

                   ),
                   Card(

                     child: Row(
                       children: <Widget>[
                         Checkbox(
                           value: _facial,
                           onChanged:prodet1.facial ? (bool value3) {
                             setState(() {
                               _facial = value3;
                               // print(_haircut);
                               _facialpress=false;
                             });
                             // _haircutpress=!_haircutpress;

                           }   :null,

                         ),

                         Text('Facial', style: TextStyle(
                             color: Colors.red, fontSize: 20.0),),


                         SizedBox(width: 218),
                         Text(prodet1.facialp, style: TextStyle(
                             color: Colors.red, fontSize: 20.0),),


                       ],
                     ),

                   ),
                   Card(

                     child: Row(
                       children: <Widget>[
                         Checkbox(
                           value: _haircol,
                           onChanged:prodet1.hairc ? (bool value4) {
                             setState(() {
                               _haircol = value4;
                               // print(_haircut);
                               _haircolpress=false;
                             });
                             // _haircutpress=!_haircutpress;

                           }   :null,

                         ),

                         Text('Hair colour', style: TextStyle(
                             color: Colors.red, fontSize: 20.0),),


                         SizedBox(width: 210),
                         Text(prodet1.haircolprice, style: TextStyle(
                             color: Colors.red, fontSize: 20.0),),


                       ],
                     ),

                   ),


                     Row(
                       children: <Widget>[


                         Text('Please select a date', style: TextStyle(
                             color: Colors.red, fontSize: 15.0),),


                         SizedBox(width: 20),
                        Text('Date: $_formattedate '),
                         SizedBox(width: 10),

                         RaisedButton(
                           child: Text('Pick a date'),
                           onPressed: () {
                             showDatePicker(
                                 context: context,
                                 initialDate: DateTime.now(),
                                 firstDate: DateTime(2019, 1),
                                 lastDate: DateTime(2021, 12),

                                 builder: (BuildContext context,
                                     Widget picker) {
                                   return Theme(
                                     //TODO: change colors
                                     data: ThemeData.dark().copyWith(
                                       colorScheme: ColorScheme.dark(
                                         primary: Colors.greenAccent,
                                         onPrimary: Colors.red,
                                         surface: Colors.greenAccent,
                                         onSurface: Colors.white,
                                       ),
                                       dialogBackgroundColor: Colors.black54,
                                     ),
                                     child: picker,
                                   );
                                 }

                             ).then((selectedDate) {
                               if (selectedDate == null) {
                                 //if user tap cancel then this function will stop
                                 return;
                               }
                               setState(() {
                                 //for rebuilding the ui
                                 _currentdate = selectedDate;
                               });
                             });
                           } )


                       ],
                     ),
          Container(
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Select a Timeslot"),
                  SizedBox(
                    width: 50.0,
                  ),
                  DropdownButton(
                    value: _selectedCompany,
                    items: _dropdownMenuItems,
                    onChanged: onChangeDropdownItem,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
               Row(
                 children: <Widget>[

                   Text('Total Bill:', style: TextStyle(
                       color: Colors.red, fontSize: 20.0),),

                   SizedBox(width: 190),
                  Text(billing, style: TextStyle(
                       color: Colors.red, fontSize: 20.0),),


                 ],
               ),

               Padding(
                 padding:
                 const EdgeInsets.all(9),
                 child: Material(
                     borderRadius: BorderRadius.circular(15.0),
                     color: Colors.white,
                     elevation: 0.0,
                     child: MaterialButton(
                       onPressed: () {
                         bill();

                       },
                       minWidth: MediaQuery.of(context).size.width,
                       child: Text(
                         "Book now",
                         textAlign: TextAlign.center,
                         style: TextStyle(
                             color: Colors.black,
                             fontWeight: FontWeight.bold,
                             fontSize: 20.0),
                       ),
                     )),
               ),


             ],
































    )));


  }

  void bill() async{

    enter.insert(0, _haircut);
    enter.insert(1, _beard);
    enter.insert(2, _headmass);
    enter.insert(3, _facial);
    enter.insert(4, _haircol);
String time=_selectedCompany.toString();

    Navigator.push(context, MaterialPageRoute(builder: (_)=> Cart(value: enter,prodet: prodet1,date: date,time: time,)));
  }
}
