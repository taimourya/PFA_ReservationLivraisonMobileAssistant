
import 'package:assistant/widgets/ReclamationEnCours.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assistant/widgets/DrawerMenu.dart';
import 'package:assistant/widgets/Home.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:assistant/API/Host.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ReclamationTrouver extends StatefulWidget {

  int reclamationId;

  ReclamationTrouver(this.reclamationId);

  @override
  _ReclamationTrouverState createState() {
    return _ReclamationTrouverState();
  }
}

class _ReclamationTrouverState extends State<ReclamationTrouver> {


  Duration get loginTime => Duration(milliseconds: 100);
  late int userId;

  @override
  void initState() {
    super.initState();
    getSharedUserId();
  }

  Future<void> getSharedUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final id = prefs.getInt('user_id');
    print(id);
    setState(() {
      userId = id == null? 0 : id;
    });
  }

  void _accepterLivraison() {
    var url = Uri.parse(
        "http://${Host.url}:8080/reclamation/accept"
            "?assistant_id=$userId"
            "&reclamation_id=${widget.reclamationId}"
    );

    http.get(url).then((response) {
      print(response.body);
      if(response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ReclamationEnCours()),
        );
      }
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: Colors.green,
        ),
        drawer: DrawerMenu(),
        body: Column(
          children: [
            SizedBox(height: 35,),
            Text(
                "Commande trouver !",
                style: Theme.of(context).textTheme.headline4
            ),
            SizedBox(height: 80,),
            Row(
              children: [
                SizedBox(width: 10,),

                Expanded(
                  child: ElevatedButton(
                    child: Text("Accepter"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    onPressed: (){
                      _accepterLivraison();
                    },
                  ),
                ),

                SizedBox(width: 10,),

                Expanded(
                  child: ElevatedButton(
                    child: Text("Refuser"),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                  ),
                ),

                SizedBox(width: 10,),
              ],
            )
          ],
        )
    );
  }
}