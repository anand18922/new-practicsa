import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Anand'),
            accountEmail: Text('officialanandsinha101@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                    'https://avatars0.githubusercontent.com/u/8264639?s=460&v=4'),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorites'),
          ),
          ListTile(leading: Icon(Icons.icecream), title: Text('About Courses'))
        ],
      ),
    );
  }
}
