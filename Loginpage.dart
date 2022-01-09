import 'dart:async';
import 'package:flutter/material.dart';
import 'package:untitled1/Aboutus_screen.dart';
import 'package:untitled1/Contactus_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled1/signup.dart';
import 'package:untitled1/Testpaper.dart';
import 'package:untitled1/NavBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/api/api.dart';
import 'package:untitled1/MyHome.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController textController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  _showMsg(msg) { //
    final snackBar = SnackBar(
      backgroundColor: Color(0xFF363f93),
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _login() async {
    var data = {
      'email' : emailController.text,
      'password' : textController.text,
    };

    var res = await CallApi().postData(data, 'login');
    var body = json.decode(res.body);
    print(body);
    if(body['success']){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', body['token']);
      localStorage.setString('login', json.encode(body['login']));
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => MyHome()));
    }else{
      _showMsg(body['message']);
    }
  }
  get globalFormKey => null;
  bool hidePassword = true;
  get scaffoldKey => null;


  @override


  Widget build(BuildContext context) {

    return Scaffold(
        key: scaffoldKey,


        appBar: AppBar(


          title: Center(child: new Text("Practicsa"),),
        ),

        body: SingleChildScrollView(
            child:Column(
                children:<Widget>[
                  Stack(
                      children:<Widget>[
                        Container(

                          width:double.infinity,

                          padding: EdgeInsets.symmetric(vertical: 30,horizontal:20),
                          margin: EdgeInsets.symmetric(vertical: 85,horizontal:20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius. circular(20),
                              color: Theme.of(context).secondaryHeaderColor,
                              boxShadow: [

                                BoxShadow(color: Theme.of(context).hintColor.withOpacity(0.2),
                                    offset: Offset(0,10),
                                    blurRadius:20

                                ) ]


                          ),

                          child:Form(key: globalFormKey, child: Column(
                            children:<Widget> [
                              SizedBox(height: 25,),
                              Text("Login",style:Theme.of(context).textTheme.headline2,),
                              SizedBox(height: 20,),
                              new TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                validator: (input)=> !input!.contains("@")
                                    ?" Email Id should be Valid":null,
                                decoration: new InputDecoration(hintText:"Email Address",
                                    enabledBorder: UnderlineInputBorder(borderSide:BorderSide(color:Theme.of(context).accentColor.withOpacity(0.2),

                                    ),
                                    ),
                                    focusedBorder: UnderlineInputBorder
                                      (borderSide:BorderSide
                                      (color: Theme.of(context).accentColor,)
                                      ,),
                                    prefixIcon: Icon(Icons.email,color:
                                    Theme.of(context).accentColor)

                                ),
                              ),
                              SizedBox(height: 20,),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                validator: (input)=> input!.length < 3
                                    ?" Password  should be more than 3 charecters":null,
                                obscureText: hidePassword,
                                decoration: new InputDecoration(hintText:"Password",
                                  enabledBorder: UnderlineInputBorder(borderSide:BorderSide(color:Theme.of(context).accentColor.withOpacity(0.2),

                                  ),
                                  ),
                                  focusedBorder: UnderlineInputBorder
                                    (borderSide:BorderSide
                                    (color: Theme.of(context).accentColor,)
                                    ,),
                                  prefixIcon: Icon(Icons.lock,
                                      color:
                                      Theme.of(context).accentColor),
                                  suffixIcon: IconButton(
                                    onPressed: (){
                                      setState(() {
                                        hidePassword =!hidePassword;
                                      });
                                    },
                                    color: Theme.of(context).accentColor.withOpacity(0.4)
                                    , icon:Icon(hidePassword? Icons.visibility_off:
                                  Icons.visibility),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30,),
                              FlatButton( padding: EdgeInsets .symmetric(vertical: 12,horizontal: 80),

                                onPressed:(){
                                  Navigator.push(context,
                                      // MaterialPageRoute(builder: (context) => MyHome()));
                                  _login());
                                },
                                child: Text("Login",style: TextStyle(color:Colors.white),),

                                color: Theme.of(context).accentColor,
                                shape: StadiumBorder(),),

                              SizedBox(height: 5,),
                              FlatButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => signup()));

                                },
                                child: Text(
                                  'sign up',style:Theme.of(context).textTheme.headline6,),




                              ),


                            ],


                          ),),





























                          // alignment: Alignment.center,
                          //padding: EdgeInsets.all(10),

                          //
                          //           child: TextField(decoration: InputDecoration(
                          //               border: OutlineInputBorder(),
                          //               labelText: "Email Id",
                          //               hintText: 'Enter you email id',
                          //               prefixIcon: Icon(Icons.email,color:
                          //               Theme.of(context).accentColor)
                          //
                          //
                          //           ),
                          //
                          //
                          //           )
                          //       ),
                          //       Container(
                          //
                          //           padding: EdgeInsets.all(10),
                          //           child: TextField(decoration: InputDecoration(
                          //               border: OutlineInputBorder(),
                          //               labelText: "Password",
                          //               hintText: 'Enter your Password',
                          //               prefixIcon: Icon(Icons.lock,color:
                          //           Theme.of(context).accentColor)),
                          //
                          //           )
                          //       ),
                          //       Container(
                          //         child: RaisedButton(
                          //           textColor: Colors.white,
                          //           color: Colors.teal,
                          //           onPressed: () {
                          //             Navigator.push(context,
                          //                 MaterialPageRoute(builder: (context) => MyHome()));
                          //           },
                          //           child: Text('Login'),
                          //
                          //
                          //         ),
                          //       ),
                          //
                          //       FlatButton(
                          //         onPressed: () {
                          //           //TODO FORGOT PASSWORD SCREEN GOES HERE
                          //         },
                          //         child: Text(
                          //           'Forgot Password',
                          //           style: TextStyle(color: Colors.teal, fontSize: 15),
                          //         ),
                          //       ),
                          //       FlatButton(
                          //         onPressed: () {
                          //           Navigator.push(context,
                          //               MaterialPageRoute(builder: (context) => signup()));
                          //         },
                          //         child: Text(
                          //           'sign up',
                          //           style: TextStyle(color: Colors.teal, fontSize: 15),
                          //         ),
                          //       ),
                          //
                          //
                          //     ]
                          //
                          //
                          // )
                        )
                      ]
                  )
                ]
            )
        )
    );
  }


}

void setState(Null Function() param0) {
}