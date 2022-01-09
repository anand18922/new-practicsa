import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Question()));
}

// ignore: camel_case_types
class Question extends StatefulWidget {
  var userdata = new Map();
  @override
  QuestionState createState() => QuestionState();
}

// ignore: camel_case_types
class QuestionState extends State<Question> {
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Questions"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(child: Text('what is computers')),
          Row(
            children: [
              Radio(
                value: 1,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = int.parse(value.toString());
                  });
                },
              ),
              SizedBox(
                width: 10.0,
              ),
              Text("machine"),
            ],
          ),
          Row(
            children: [
              Radio(
                value: 2,
                groupValue: _value,
                onChanged: (value) {
                  setState(
                        () {
                      _value = int.parse(value.toString());
                    },
                  );
                },
              ),
              SizedBox(
                width: 10.0,
              ),
              Text("el"),
            ],
          ),
          Row(
            children: [
              Radio(
                value: 2,
                groupValue: _value,
                onChanged: (value) {
                  setState(
                        () {
                      _value = int.parse(value.toString());
                    },
                  );
                },
              ),
              SizedBox(
                width: 10.0,
              ),
              Text("machine"),
            ],
          ),
          Row(
            children: [
              Radio(
                value: 2,
                groupValue: _value,
                onChanged: (value) {
                  setState(
                        () {
                      _value = int.parse(value.toString());
                    },
                  );
                },
              ),
              SizedBox(
                width: 10.0,
              ),
              Text("machine"),
            ],
          ),
          Row(
            children: [
              Radio(
                value: 2,
                groupValue: _value,
                onChanged: (value) {
                  setState(
                        () {
                      _value = int.parse(value.toString());
                    },
                  );
                },
              ),
              SizedBox(
                width: 10.0,
              ),
              Text("none of these"),
            ],
          ),
        ],
      ),
    );
  }
}
