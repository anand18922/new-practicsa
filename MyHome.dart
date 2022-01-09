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



















class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class GetUsers {
  int id;
  String class_name;

  GetUsers({required this.id, required this.class_name});

  factory GetUsers.fromJson(Map<String, dynamic> json) {
    return GetUsers(id: json['id'], class_name: json['class_name']);
  }
}

final String apiURL = 'http://api.hometutorpatna.com/api/getClass';

Future<List<GetUsers>> fetchJSONData() async {
  var jsonResponse = await http.get(Uri.parse('http://api.hometutorpatna.com/api/getClass'));

  if (jsonResponse.statusCode == 200) {
    final jsonItems =
    json.decode(jsonResponse.body).cast<Map<String, dynamic>>();

    List<GetUsers> usersList = jsonItems.map<GetUsers>((json) {
      return GetUsers.fromJson(json);
    }).toList();

    return usersList;
  } else {
    throw Exception('Failed to load data from internet');
  }
}

class _MyHomeState extends State<MyHome> {
  final name = TextEditingController();
  void _ontapselected(int index) {
    if (index == 1) {
      //Navigator.pushReplacementNamed(context, "/about");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Aboutus(),
              settings: RouteSettings(arguments: {'name': name.text})));
    }
    // if (index == 2) {
    //   //Navigator.pushReplacementNamed(context, "/home");
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) => MyHome(),
    //           settings: RouteSettings(arguments: {'name': name.text})));
    // }
    if (index == 2) {
      //Navigator.pushReplacementNamed(context, "/contactus");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Contactus_screen(),
              settings: RouteSettings(arguments: {'name': name.text})));
    }


    // Navigator.pushNamed(context, '/about');
  }

  makePostRequest() async {
    final uri = Uri.parse('url');
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {
      'device_id': 7854220,
      'fcm_id': 5874988,
      'mobile_number': 9973044945
    };
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );

    int statusCode = response.statusCode;
    String responseBody = response.body;
    print(responseBody);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.red,
        bottomOpacity: 0,
        elevation: 0,
        title: new Text("Standard"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.icecream), label: "About us"),
          BottomNavigationBarItem(
              icon: Icon(Icons.icecream), label: "Contact us"),


        ],
        selectedFontSize: 10,
        currentIndex: 0,
        onTap: _ontapselected,
      ),
      body: FutureBuilder<List<GetUsers>>(
        future: fetchJSONData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return GridView(

            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: snapshot.data!
                .map(
                  (user) => ListTile(
                title: Text(user.class_name),

                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Testpaper(1),
                          settings: RouteSettings(
                              arguments: {'name': name.text})));
                },
                subtitle: Text(user.class_name),
                leading: CircleAvatar(

                  backgroundColor: Colors.red,
                  child: Text(user.class_name[0],
                      style: TextStyle(
                        color: Colors.white,

                        fontSize: 20.0,

                      )),
                ),

                   shape: StadiumBorder(),



              ),
            )
                .toList(),
          );
        },
      ),
    );
  }
}
