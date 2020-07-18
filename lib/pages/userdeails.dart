
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modifyz/db/users.dart';
import 'package:modifyz/models/currentuser.dart';
import 'package:modifyz/pages/login.dart';
import 'package:provider/provider.dart';
import 'package:modifyz/widget/constants.dart';
import 'package:modifyz/widget/loading.dart';



class User_details extends StatefulWidget {
  @override
  _User_detailsState createState() => _User_detailsState();
}

class _User_detailsState extends State<User_details> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];
  final List<int> strengths = [100, 200, 300, 400, 500, 600, 700, 800, 900];

  // form values
  String _currentName;
  String _currentemail;
  String _currentgender;
  String _currentpin;

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
      stream: UserServices(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          UserData userData= snapshot.data;
          return Scaffold(

            body:Column(
              children: <Widget>[
                Text(userData.name),
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

          );
        }
        else{
          Text('nodata');
        }


      }
    );
  }

}
