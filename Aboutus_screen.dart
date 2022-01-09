
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home:Aboutus()));
}

class Aboutus   extends StatefulWidget {
  //const ({ Key? key }) : super(key: key);

  @override
  AboutusState createState() => AboutusState();
}

class AboutusState extends State<Aboutus> {
  @override
  Widget build(BuildContext context) {





    return Scaffold(
      appBar: AppBar(




        title: new Text("Aboutus"),
      ),
    );


  }
}