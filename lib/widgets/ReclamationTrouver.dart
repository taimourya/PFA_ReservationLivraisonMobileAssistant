
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assistant/widgets/ReclamationEnCours.dart';
import 'package:assistant/widgets/DrawerMenu.dart';
import 'package:assistant/widgets/Home.dart';

class ReclamationTrouver extends StatefulWidget {

  @override
  _ReclamationTrouverState createState() {
    return _ReclamationTrouverState();
  }
}

class _ReclamationTrouverState extends State<ReclamationTrouver> {

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
              "Reclamation trouver !",
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReclamationEnCours()),
                    );
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