
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modifyz/widget/loading.dart';
import 'home.dart';
import 'signup.dart';
import 'package:provider/provider.dart';
import 'package:modifyz/provider/user_provider.dart';
import 'package:modifyz/db/users.dart';


class Login extends StatefulWidget {
  final Function toggleView;
  Login({ this.toggleView });
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();

  final GoogleSignIn googleSignIn =new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey=GlobalKey<FormState>();
  final _key =GlobalKey<ScaffoldState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  SharedPreferences preferences;
  bool loading = false;
  bool islogedin =false;
  int x= 0;
  dynamic result;
  @override
  void initState(){
    super.initState();
    isSignedIn();
  }
  void isSignedIn() async{
    setState(() {
      loading=true;

    });
    await firebaseAuth.currentUser().then((user) {
      if(user!=null){
        setState(() {
          islogedin=true;
        });
      }
    });
    preferences=await SharedPreferences.getInstance();
    islogedin=await googleSignIn.isSignedIn();

    if(islogedin ){
    }
    setState(() {
      loading=false;
    });
  }
  Future handledSignin() async{
    preferences=await SharedPreferences.getInstance();
    setState(() {
      loading=true;
    });
    GoogleSignInAccount googleuser= await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication=await googleuser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final AuthResult authResult = await firebaseAuth.signInWithCredential(credential);
    final FirebaseUser firebaseUser = authResult.user;

    if(firebaseUser!=null){
      final QuerySnapshot result= await Firestore.instance.collection("User").where("id",isEqualTo: firebaseUser.uid).getDocuments();
      final List<DocumentSnapshot> documents =result.documents;
      if(documents.length==0){
        Firestore.instance.collection("User").document(firebaseUser.uid)
            .setData({
          "id":firebaseUser.uid,
          "username": firebaseUser.displayName,
          "userphoto":firebaseUser.photoUrl,
          "useremail":firebaseUser.email,

        });
        await preferences.setString("id", firebaseUser.uid);
        await preferences.setString("usename", firebaseUser.displayName);
        await preferences.setString("userphoto", firebaseUser.photoUrl);
        await preferences.setString("useremail", firebaseUser.email);

      }
      else{
        await preferences.setString("id", documents[0]["id"]);
        await preferences.setString("usename",documents[0]["username"] );
        await preferences.setString("photourl", documents[0]["photourl"]);
        await preferences.setString("useremail", documents[0]["useremail"]);


      }
      Fluttertoast.showToast(msg: "LOGGED IN");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));

      setState(() {
        loading=false;
      });
    }
    else{

    }

  }
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(

      body: Stack(
        children: <Widget>[
         // Image.asset('images/logoji.png',fit: BoxFit.fill,width: double.infinity,height: double.infinity,),


          Container(
            color: Colors.black.withOpacity(0.2),
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
           // padding: const EdgeInsets.only(top: 50),
            alignment: Alignment.topCenter,
            child: Image.asset('images/logoji.png',height: 400.0,width: 200.0,),
          ),

           Padding(
             padding: const EdgeInsets.only(top: 300),
             child: Center(
                child: Form(
                  key: _formKey,
                  child: ListView(
                      children: <Widget>[
    Padding(
      padding: const EdgeInsets.fromLTRB(14.0,8.0,14.0,8.0),
      child: Material(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white.withOpacity(0.8),
        elevation: 0.0,
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child:
          TextFormField(
              controller: _email,
                            decoration: InputDecoration(
                            hintText: "email",
                           icon: Icon(Icons.alternate_email),

                          border: InputBorder.none,

                        ),
              validator: (value) {
                if (value.isEmpty) {
                  Pattern pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regex = new RegExp(pattern);
                  if (!regex.hasMatch(value))
                    return 'Please make sure your email address is valid';
                  else
                    return null;
                }
              },
              ),
        ),
      ),
    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0,8.0,14.0,8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white.withOpacity(0.8),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child:  TextFormField(
                          controller: _password,
                          decoration: InputDecoration(
                              hintText: "password",
                              icon: Icon(Icons.lock_outline),
                              border: InputBorder.none),

                            validator: (value){
                              if(value.isEmpty){
                                return "password cannot be empty";
                              }else if(value.length<6){
                                return"password is short";

                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0,8.0,14.0,8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.red,
                        elevation: 0.0,
                        child: MaterialButton(onPressed: () async{
                       if(_formKey.currentState.validate()) {
                         if (!await _auth.signInWithEmailAndPassword(_email.text, _password.text)) {
                           _key.currentState.showSnackBar(
                               SnackBar(content: Text("Sign in failed")));
                           return;
                         }


                         Navigator.push(context, MaterialPageRoute(
                             builder: (context) => HomePage()));
                       }
                            },

                        minWidth: MediaQuery.of(context).size.width,
                        child: Text("Login",textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22.0),),)
                      ),
                    ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                         context,
                                       MaterialPageRoute(
                                         builder: (context) => SignUp()));
                                    },
                                    child: Text(
                                      "Forgot Password",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black),
                                    ))),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                    onTap: () {
                                    Navigator.push(
                                      context,
                                   MaterialPageRoute(
                                     builder: (context) => SignUp()));
                                    },
                                    child: Text(
                                      "Create an account",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black),
                                    ))),
                          ],
                        ),
                      Expanded(child: Container()),
                      Divider(color: Colors.white,),
                      Text('Other Login options', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16.0),textAlign: TextAlign.center,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.red,
                              elevation: 0.0,
                              child: MaterialButton(onPressed: (){
                                handledSignin();

                              },
                                minWidth: MediaQuery.of(context).size.width,
                                child: Text("google",textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22.0),),)
                          ),
                        )
  ] ),
          ),
          ),
           ),
          Visibility(
              visible: loading ?? true, child:Center(
              child:Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.7),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.red),
                ),
              )
              )
          )




        ],
      ),
     
    );
  }





}
