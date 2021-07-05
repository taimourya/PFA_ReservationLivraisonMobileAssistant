


import 'dart:collection';
import 'dart:convert';

import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:assistant/API/Host.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Chat extends StatefulWidget {

  dynamic data;


  Chat(this.data);

  @override
  State<StatefulWidget> createState() {
    return _StateChat();
  }

}

class _StateChat extends State<Chat>{

  List<ChatMessage> chatMessages = [];

  Duration get loginTime => Duration(milliseconds: 100);
  late int userId;

  Future<void> getSharedUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final id = prefs.getInt('user_id');
    print(id);
    setState(() {
      userId = id == null? 0 : id;
    });
  }

  @override
  void initState() {
    print(widget.data);
    getSharedUserId();
    Future.delayed(loginTime).then((_) {
    });
    super.initState();
    chatMessages.add(
        ChatMessage(
          text: "${widget.data==null?'':widget.data['message']}",
          user: ChatUser(
            name: "${widget.data==null? ''
                : "${widget.data['user']['firstname']} ${widget.data['user']['lastname']}"}",
            uid: "${widget.data==null?'':widget.data['user']['id']}",
            //avatar: "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
          ),
          createdAt: DateTime.now(),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return DashChat(
        user: ChatUser(
          name: "Taimourya yahya",
          uid: "1",
          avatar: "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
        ),
        messages: chatMessages,
        onSend: (ChatMessage ) {
          setState(() {
            chatMessages.add(ChatMessage);
          });
        },
    );
  }


}