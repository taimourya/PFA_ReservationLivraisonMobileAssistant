


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assistant/widgets/DrawerMenu.dart';
import 'package:assistant/widgets/Chat.dart';

class ReclamationEnCours extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateReclamationEnCours();
  }


}

class _StateReclamationEnCours extends State<ReclamationEnCours>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text("Chat en cours"),
            actions: [
              TextButton(
                child: Text("Transferer", style: TextStyle(color: Colors.cyan),),
                onPressed: () {

                },
              ),
              TextButton(
                child: Text("Resolu", style: TextStyle(color: Colors.cyan),),
                onPressed: () {

                },
              ),
            ],
          ),
          drawer: DrawerMenu(),
          body:  Chat(),
        );
  }



}