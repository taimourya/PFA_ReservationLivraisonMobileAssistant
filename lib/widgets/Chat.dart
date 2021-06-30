


import 'dart:collection';

import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateChat();
  }

}

class _StateChat extends State<Chat>{

  List<ChatMessage> chatMessages = [];


  @override
  void initState() {
    super.initState();
    chatMessages.add(
        ChatMessage(
          text: "Bonjour !",
          user: ChatUser(
            name: "Diyaa benyas-errahmane",
            uid: "2",
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