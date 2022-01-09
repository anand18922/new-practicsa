import 'dart:async';
import 'package:flutter/material.dart';
import 'package:untitled1/Aboutus_screen.dart';
import 'package:untitled1/Contactus_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled1/Loginpage.dart';
import 'package:untitled1/Testpaper.dart';
import 'package:untitled1/NavBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/api/api.dart';
import 'package:untitled1/MyHome.dart';
import 'package:untitled1/Loginpage.dart';
import 'package:untitled1/signup.dart';







void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget


{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/Abouts_screen': (context) => Aboutus(),
        '/Contactus_screen': (context) => Contactus_screen(),
        '/onscreen': (context) => const Loginpage(),
        '/seigneurs': (context) => const signup(),

      },

      theme: ThemeData(
        primarySwatch: Colors.red,
        secondaryHeaderColor: Colors.white,
      ),

      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                Loginpage()
            )
        )
    );
  }
  GlobalKey<FormState> globalKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
         child:FlutterLogo(size:MediaQuery.of(context).size.height)


    );
  }
}
// // class Loginpage extends StatelessWidget
// //
// //
// //
// // {
// //
// //
// //
// //   get globalFormKey => null;
// //   bool hidePassword = true;
// //   get scaffoldKey => null;
// //   TextEditingController textController = TextEditingController();
// //   TextEditingController emailController = TextEditingController();
// //
// //
// //
// //
// //   _showMsg(msg) { //
// //     final snackBar = SnackBar(
// //       backgroundColor: Color(0xFF363f93),
// //       content: Text(msg),
// //       action: SnackBarAction(
// //         label: 'Close',
// //         onPressed: () {
// //           // Some code to undo the change!
// //         },
// //       ),
// //     );
// //
// //   }
// //   _login() async {
// //     var data = {
// //       'email' : emailController.text,
// //       'password' : textController.text,
// //     };
// //
// //     var res = await CallApi().postData(data, 'login');
// //     var body = json.decode(res.body);
// //     print(body);
// //     if(body['success']){
// //       SharedPreferences localStorage = await SharedPreferences.getInstance();
// //       localStorage.setString('token', body['token']);
// //       localStorage.setString('login', json.encode(body['login']));
// //
// //       Navigator.push(
// //           context,
// //           new MaterialPageRoute(
// //               builder: (context) => MyHome()));
// //     }else{
// //       _showMsg(body['message']);
// //     }
// //   }
// //
// //
// //
// //
// //
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //
// //     return Scaffold(
// //         key: scaffoldKey,
// //
// //
// //         appBar: AppBar(
// //
// //
// //           title: Center(child: new Text("Practicsha"),),
// //         ),
// //
// //         body: SingleChildScrollView(
// //             child:Column(
// //               children:<Widget>[
// //                Stack(
// //                 children:<Widget>[
// //                   Container(
// //
// //                    width:double.infinity,
// //
// //                    padding: EdgeInsets.symmetric(vertical: 30,horizontal:20),
// //                    margin: EdgeInsets.symmetric(vertical: 85,horizontal:20),
// //                   decoration: BoxDecoration(
// //                     borderRadius: BorderRadius. circular(20),
// //                       color: Theme.of(context).secondaryHeaderColor,
// //                     boxShadow: [
// //
// //                    BoxShadow(color: Theme.of(context).hintColor.withOpacity(0.2),
// //                    offset: Offset(0,10),
// //                    blurRadius:20
// //
// //                  ) ]
// //
// //
// //                   ),
// //
// //                   child:Form(key: globalFormKey, child: Column(
// //                        children:<Widget> [
// //                          SizedBox(height: 25,),
// //                           Text("Login",style:Theme.of(context).textTheme.headline2,),
// //                          SizedBox(height: 20,),
// //                          new TextFormField(
// //                            keyboardType: TextInputType.emailAddress,
// //                            validator: (input)=> !input!.contains("@")
// //                                ?" Email Id should be Valid":null,
// //                            decoration: new InputDecoration(hintText:"Email Address",
// //                                enabledBorder: UnderlineInputBorder(borderSide:BorderSide(color:Theme.of(context).accentColor.withOpacity(0.2),
// //
// //                                ),
// //                                ),
// //                                focusedBorder: UnderlineInputBorder
// //                                  (borderSide:BorderSide
// //                                  (color: Theme.of(context).accentColor,)
// //                                  ,),
// //                                prefixIcon: Icon(Icons.email,color:
// //                                Theme.of(context).accentColor)
// //
// //                            ),
// //                          ),
// //                          SizedBox(height: 20,),
// //                          TextFormField(
// //                            keyboardType: TextInputType.text,
// //                            validator: (input)=> input!.length < 3
// //                                ?" Password  should be more than 3 charecters":null,
// //                            obscureText: hidePassword,
// //                            decoration: new InputDecoration(hintText:"Password",
// //                                enabledBorder: UnderlineInputBorder(borderSide:BorderSide(color:Theme.of(context).accentColor.withOpacity(0.2),
// //
// //                                ),
// //                                ),
// //                                focusedBorder: UnderlineInputBorder
// //                                  (borderSide:BorderSide
// //                                  (color: Theme.of(context).accentColor,)
// //                                  ,),
// //                                prefixIcon: Icon(Icons.lock,
// //                                    color:
// //                                Theme.of(context).accentColor),
// //                              suffixIcon: IconButton(
// //                                 onPressed: (){
// //                                   setState(() {
// //                                     hidePassword =!hidePassword;
// //                                   });
// //                                 },
// //                                color: Theme.of(context).accentColor.withOpacity(0.4)
// //                                , icon:Icon(hidePassword? Icons.visibility_off:
// //                              Icons.visibility),
// //                              ),
// //                            ),
// //                          ),
// //                          SizedBox(height: 30,),
// //                          FlatButton( padding: EdgeInsets .symmetric(vertical: 12,horizontal: 80),
// //
// //                              onPressed:(){
// //                                // Navigator.push(context,
// //                                //     MaterialPageRoute(builder: (context) => MyHome()));
// //                                _login();
// //                              },
// //                            child: Text("Login",style: TextStyle(color:Colors.white),),
// //
// //                          color: Theme.of(context).accentColor,
// //                          shape: StadiumBorder(),),
// //
// //                          SizedBox(height: 5,),
// //                     FlatButton(
// //                               onPressed: () {
// //                                 Navigator.push(context,
// //                                     MaterialPageRoute(builder: (context) => signup()));
// //                               },
// //                               child: Text(
// //                                 'sign up',style:Theme.of(context).textTheme.headline6,),
// //
// //
// //
// //
// //                             ),
// //
// //
// //                        ],
// //
// //
// //                           ),),
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //                   // alignment: Alignment.center,
// //                   //padding: EdgeInsets.all(10),
// //
// //         //
// //         //           child: TextField(decoration: InputDecoration(
// //         //               border: OutlineInputBorder(),
// //         //               labelText: "Email Id",
// //         //               hintText: 'Enter you email id',
// //         //               prefixIcon: Icon(Icons.email,color:
// //         //               Theme.of(context).accentColor)
// //         //
// //         //
// //         //           ),
// //         //
// //         //
// //         //           )
// //         //       ),
// //         //       Container(
// //         //
// //         //           padding: EdgeInsets.all(10),
// //         //           child: TextField(decoration: InputDecoration(
// //         //               border: OutlineInputBorder(),
// //         //               labelText: "Password",
// //         //               hintText: 'Enter your Password',
// //         //               prefixIcon: Icon(Icons.lock,color:
// //         //           Theme.of(context).accentColor)),
// //         //
// //         //           )
// //         //       ),
// //         //       Container(
// //         //         child: RaisedButton(
// //         //           textColor: Colors.white,
// //         //           color: Colors.teal,
// //         //           onPressed: () {
// //         //             Navigator.push(context,
// //         //                 MaterialPageRoute(builder: (context) => MyHome()));
// //         //           },
// //         //           child: Text('Login'),
// //         //
// //         //
// //         //         ),
// //         //       ),
// //         //
// //         //       FlatButton(
// //         //         onPressed: () {
// //         //           //TODO FORGOT PASSWORD SCREEN GOES HERE
// //         //         },
// //         //         child: Text(
// //         //           'Forgot Password',
// //         //           style: TextStyle(color: Colors.teal, fontSize: 15),
// //         //         ),
// //         //       ),
// //         //       FlatButton(
// //         //         onPressed: () {
// //         //           Navigator.push(context,
// //         //               MaterialPageRoute(builder: (context) => signup()));
// //         //         },
// //         //         child: Text(
// //         //           'sign up',
// //         //           style: TextStyle(color: Colors.teal, fontSize: 15),
// //         //         ),
// //         //       ),
// //         //
// //         //
// //         //     ]
// //         //
// //         //
// //         // )
// //         )
// //   ]
// //         )
// //     ]
// //     )
// //         )
// //     );
// //   }
// //
// //
// // }
//
//
// void setState(Null Function() param0) {
// }
//
//
// class Todo {
//   final String paper_name;
//
//   const Todo(this.paper_name);
// }
//
// class MyHome extends StatefulWidget {
//   @override
//   _MyHomeState createState() => _MyHomeState();
// }
//
// class GetUsers {
//   int id;
//   String class_name;
//
//   GetUsers({required this.id, required this.class_name});
//
//   factory GetUsers.fromJson(Map<String, dynamic> json) {
//     return GetUsers(id: json['id'], class_name: json['class_name']);
//   }
// }
//
// final String apiURL = 'http://api.hometutorpatna.com/api/getClass';
//
// Future<List<GetUsers>> fetchJSONData() async {
//   var jsonResponse = await http.get(Uri.parse('http://api.hometutorpatna.com/api/getClass'));
//
//   if (jsonResponse.statusCode == 200) {
//     final jsonItems =
//     json.decode(jsonResponse.body).cast<Map<String, dynamic>>();
//
//     List<GetUsers> usersList = jsonItems.map<GetUsers>((json) {
//       return GetUsers.fromJson(json);
//     }).toList();
//
//     return usersList;
//   } else {
//     throw Exception('Failed to load data from internet');
//   }
// }
//
// class _MyHomeState extends State<MyHome> {
//   final name = TextEditingController();
//   void _ontapselected(int index) {
//     if (index == 1) {
//       //Navigator.pushReplacementNamed(context, "/about");
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => Aboutus(),
//               settings: RouteSettings(arguments: {'name': name.text})));
//     }
//     // if (index == 2) {
//     //   //Navigator.pushReplacementNamed(context, "/home");
//     //   Navigator.push(
//     //       context,
//     //       MaterialPageRoute(
//     //           builder: (context) => MyHome(),
//     //           settings: RouteSettings(arguments: {'name': name.text})));
//     // }
//     if (index == 2) {
//       //Navigator.pushReplacementNamed(context, "/contactus");
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => Contactus_screen(),
//               settings: RouteSettings(arguments: {'name': name.text})));
//     }
//
//
//     // Navigator.pushNamed(context, '/about');
//   }
//
//   makePostRequest() async {
//     final uri = Uri.parse('url');
//     final headers = {'Content-Type': 'application/json'};
//     Map<String, dynamic> body = {
//       'device_id': 7854220,
//       'fcm_id': 5874988,
//       'mobile_number': 9973044945
//     };
//     String jsonBody = json.encode(body);
//     final encoding = Encoding.getByName('utf-8');
//
//     http.Response response = await http.post(
//       uri,
//       headers: headers,
//       body: jsonBody,
//       encoding: encoding,
//     );
//
//     int statusCode = response.statusCode;
//     String responseBody = response.body;
//     print(responseBody);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: NavBar(),
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         bottomOpacity: 0,
//         elevation: 0,
//         title: new Text("Standard"),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.icecream), label: "About us"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.icecream), label: "Contact us"),
//
//
//         ],
//         selectedFontSize: 10,
//         currentIndex: 0,
//         onTap: _ontapselected,
//       ),
//       body: FutureBuilder<List<GetUsers>>(
//         future: fetchJSONData(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData)
//             return Center(child: CircularProgressIndicator());
//
//           return GridView(
//
//             gridDelegate:
//             SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//             children: snapshot.data!
//                 .map(
//                   (user) => ListTile(
//                 title: Text(user.class_name),
//
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Testpaper(1),
//                           settings: RouteSettings(
//                               arguments: {'name': name.text})));
//                 },
//                 subtitle: Text(user.class_name),
//                 leading: CircleAvatar(
//
//                   backgroundColor: Colors.red,
//                   child: Text(user.class_name[0],
//                       style: TextStyle(
//                         color: Colors.white,
//
//                         fontSize: 20.0,
//
//                       )),
//                 ),
//
//                    shape: StadiumBorder(),
//
//
//
//               ),
//             )
//                 .toList(),
//           );
//         },
//       ),
//     );
//   }
// }
//
//
//
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
