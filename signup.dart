import 'dart:async';
import 'package:flutter/material.dart';
import 'package:untitled1/Aboutus_screen.dart';
import 'package:untitled1/Contactus_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled1/Loginpage.dart';
import 'package:untitled1/MyHome.dart';
import 'package:untitled1/Question.dart';
import 'package:untitled1/Testpaper.dart';
import 'package:untitled1/NavBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/api/api.dart';

// class signup extends StatefulWidget {
//   // const signup({Key? key}) : super(key: key);
//   @override
//   _signupState createState() => _signupState();
// } MakePostRequest() async {
//   final uri = Uri.parse('http://api.hometutorpatna.com/api/getlogin');
//   final headers = {'Content-Type': 'application/json; charset=UTF-8'};
//   Map<String, dynamic> body = {
//
//   };
//   String jsonBody = json.encode(body);
//   final encoding = Encoding.getByName('utf-8');
//
//   http.Response response = await http.post(
//     uri,
//     headers: headers,
//     body: jsonBody,
//     encoding: encoding,
//   );
//
//   int statusCode = response.statusCode;
//   String responseBody = response.body;
//   print(responseBody);
//
// }
//
// class _signupState extends State<signup> {
//   final password=TextEditingController();
//   final name=TextEditingController();
//   final email=TextEditingController();
//   final id=TextEditingController();
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//
//       home: Scaffold(
//           appBar: AppBar(
//             title: Center(child: new Text("Signup") ,),
//           ),
//           body: Column(
//               children: [
//                 Container(
//
//
//                     alignment: Alignment.center,
//                     padding: EdgeInsets.all(10),
//
//                     child: TextField(controller: name,decoration: InputDecoration(labelText: "Name",
//                         border: OutlineInputBorder(),
//                         hintText: 'Enter your name'),
//
//                     )
//                 ),
//                 Container(
//
//
//                     alignment: Alignment.center,
//                     padding: EdgeInsets.all(10),
//
//                     child: TextField(controller: email,decoration: InputDecoration(labelText: "Email",
//                         border: OutlineInputBorder(),
//                         hintText: 'Enter you email id'),
//
//                     )
//                 ),
//                 Container(
//
//
//                     alignment: Alignment.center,
//                     padding: EdgeInsets.all(10),
//
//                     child: TextField(controller: id,decoration: InputDecoration(labelText: "id",
//                         border: OutlineInputBorder(),
//                         hintText: 'Enter your id'),
//
//                     )
//                 ),
//                 Container(
//
//
//                     alignment: Alignment.center,
//                     padding: EdgeInsets.all(10),
//
//                     child: TextField(controller:password,decoration: InputDecoration(labelText: "password",
//                         border: OutlineInputBorder(),
//                         hintText: 'Enter your password'),
//
//                     )
//                 ),
//                 Container(
//                   child: FlatButton(
//                     color: Colors.red,
//                     child: Text('Submit', style: TextStyle(fontSize: 20.0,
//                       color: Colors.white,),
//                     ),
//                     onPressed: MakePostRequest,
//                   ),
//                 ),
//               ]
//           )
//
//       ),
//
//     );
//   }
// }
//












// class _signupState extends State<signup> {
//   final password=TextEditingController();
//   final name=TextEditingController();
//   final email=TextEditingController();
//   final id=TextEditingController();
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//
//       home: Scaffold(
//           appBar: AppBar(
//             title: Center(child: new Text("Signup") ,),
//           ),
//           body: Column(
//               children: [
//                 Container(
//
//
//                     alignment: Alignment.center,
//                     padding: EdgeInsets.all(10),
//
//                     child: TextField(controller: name,decoration: InputDecoration(labelText: "Name",
//                         border: OutlineInputBorder(),
//                         hintText: 'Enter your name'),
//
//                     )
//                 ),
//                 Container(
//
//
//                     alignment: Alignment.center,
//                     padding: EdgeInsets.all(10),
//
//                     child: TextField(controller: email,decoration: InputDecoration(labelText: "Email",
//                         border: OutlineInputBorder(),
//                         hintText: 'Enter you email id'),
//
//                     )
//                 ),
//                 Container(
//
//
//                     alignment: Alignment.center,
//                     padding: EdgeInsets.all(10),
//
//                     child: TextField(controller: id,decoration: InputDecoration(labelText: "id",
//                         border: OutlineInputBorder(),
//                         hintText: 'Enter your id'),
//
//                     )
//                 ),
//                 Container(
//
//
//                     alignment: Alignment.center,
//                     padding: EdgeInsets.all(10),
//
//                     child: TextField(controller:password,decoration: InputDecoration(labelText: "password",
//                         border: OutlineInputBorder(),
//                         hintText: 'Enter your password'),
//
//                     )
//                 ),
//                 Container(
//                   child: FlatButton(
//                     color: Colors.red,
//                     child: Text('Submit', style: TextStyle(fontSize: 20.0,
//                       color: Colors.white,),
//                     ),
//                     onPressed: MakePostRequest,
//                   ),
//                 ),
//               ]
//           )
//
//       ),
//
//     );
//   }
// }
//

































class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController nameController= TextEditingController();
   TextEditingController emailAddressController= TextEditingController();
   TextEditingController textController= TextEditingController();





  void  senddata(String name, emailAddress,text) async {

    final response = await http.post(Uri.parse("http://api.hometutorpatna.com/api/getpost"),
        body: {
      'name': name,
      'email': emailAddress,
      'password': text,
    });
    if (response.statusCode == 200 ) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      final result  = json.decode(response.body);
      return result;

    } else {
      print('failed');
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      // return 'Failed to create account.';
    }

  }










  // TextEditingController textController = TextEditingController();
  // TextEditingController visiblepasswordController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  // Future<List> senddata() async{
  //   final response = await
  //       http.post("http://api.hometutorpatna.com/api/getlogin",body: {
  //         ""
  //
  //
  //
  //       });
  //
  //
  // }
  //
  
  
  
  // @override
  // // void initState() {
  // //   // TODO: implement initState
  // //   super.initState();
  // // }
  
  
  
  
  

  // _register() async {
  //   var data = {
  //     'name'  :textController.text,
  //     'email' : emailController.text,
  //     'password' : visiblepasswordController.text,
  //   };
  //   debugPrint(textController.text);
  //   debugPrint(emailController.text);
  //   debugPrint(visiblepasswordController.text);
  //
  //
  //   var res = await CallApi().postData(data, 'insert');
  //   var body = json.decode(res.body);
  //   print(body);
  //   if(body['success']){
  //     //SharedPreferences localStorage = await SharedPreferences.getInstance();
  //     // localStorage.setString('token', body['token']);
  //     //localStorage.setString('user', json.encode(body['user']));
  //     Navigator.push(
  //         context,
  //         new MaterialPageRoute(
  //             builder: (context) => MyHome()));
  //   }
  // }
  get globalFormKey => null;
  bool hidePassword = true;
  get scaffoldKey => null;


  @override


  Widget build(BuildContext context) {

    return Scaffold(
        key: scaffoldKey,


        appBar: AppBar(


          title: Center(child: new Text("Practicsha"),),
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
                              Text("Signup",style:Theme.of(context).textTheme.headline2,),
                              SizedBox(height: 20,),
                              new TextFormField(
                                keyboardType: TextInputType.name,
                                 controller: nameController,
                                decoration: new InputDecoration(hintText:"Name",
                                    enabledBorder: UnderlineInputBorder(borderSide:BorderSide(color:Theme.of(context).accentColor.withOpacity(0.2),

                                    ),
                                    ),
                                    focusedBorder: UnderlineInputBorder
                                      (borderSide:BorderSide
                                      (color: Theme.of(context).accentColor,)
                                      ,),
                                    prefixIcon: Icon(Icons.person,color:
                                    Theme.of(context).accentColor)

                                ),
                              ),
                              SizedBox(height: 20,),



                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: emailAddressController,
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
                                controller: textController,
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
                                  // Navigator.push(context,
                                      // MaterialPageRoute(builder: (context) => MyHome()));
                                      // _register());
                                  senddata(nameController.text.toString(),emailAddressController.text.toString(),textController.text.toString());
                                },
                                child: Text("Signup",style: TextStyle(color:Colors.white),),

                                color: Theme.of(context).accentColor,
                                shape: StadiumBorder(),),





                      ]
                  )
                          )
            )

            ]


            )
        ]
        )
        )
    );
  }


}
