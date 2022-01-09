import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'package:untitled1/Question.dart';


class GetUsers {
  int id;
  String paper_name;

  GetUsers({required this.id, required this.paper_name});

  factory GetUsers.fromJson(Map<String, dynamic> json) {
    return GetUsers(id: json['id'], paper_name: json['paper_name']);
  }
}

final String apiURL = 'http://api.hometutorpatna.com/api/getTestpaper/8';

final String secondURL = 'http://api.hometutorpatna.com/api/getTestpaper/9';
final String thirdURL = 'http://api.hometutorpatna.com/api/getTestpaper/10';
final String fourthURL = 'http://api.hometutorpatna.com/api/getTestpaper/11';
final String fifthURL = 'http://api.hometutorpatna.com/api/getTestpaper/12';

Future<List<GetUsers>> fetchJSONData() async {
  var jsonResponse = await http.get(Uri.parse('http://api.hometutorpatna.com/api/getTestpaper/9'));
  //await http.get(secondURL);
  //await http.get(thirdURL);
  //await http.get(fourthURL);
  //await http.get(fifthURL);

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

class Testpaper extends StatelessWidget {
  var userdata = new Map();

  Testpaper(class_name);
  // void test() {
  //   print("Shared preference");
  //   WidgetsFlutterBinding.ensureInitialized();
  //   SharedPreferences prefs =
  //       SharedPreferences.getInstance() as SharedPreferences;
  //   var email = prefs.getString('email');
  //   print(email);
  // }

  // Future<void> main() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var email = prefs.getString('email');
  //   print(email);
  // }

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

    Response response = await post(
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
      appBar: AppBar(
        title: new Text("Subjects"),
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
                title: Text(user.paper_name),
                onTap: () {
                  var name;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Question(),
                          settings: RouteSettings(
                              arguments: {'name': name.text})));
                },
                subtitle: Text(user.paper_name),
                leading: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text(user.paper_name[0],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      )),
                ),
              ),
            )
                .toList(),
          );
        },
      ),
    );
  }
}
