


import 'package:assistant/widgets/Home.dart';
import 'package:assistant/widgets/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assistant/widgets/ReclamationEnCours.dart';
import 'package:assistant/widgets/Settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerMenu extends StatelessWidget {

  Future<void> removeSharedUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('user_id');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Assistance Application'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.mail),
            title: Text('Reclamation en cours'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReclamationEnCours()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Settings()),
              );
            },
          ),

          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              removeSharedUserId();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
          ),
        ],
      ),
    );
  }

}