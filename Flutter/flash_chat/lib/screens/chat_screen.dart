import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/message_bubble.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChatScreen extends StatefulWidget {
  static const id = "Chat Screen";

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _store = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  final textController = TextEditingController();
  String? message;

  @override
  void initState() {
    super.initState();
    print(_auth.currentUser);
    loadMessages();
  }

  void loadMessages() async {
    // final messages = await _store.collection("messages").get();
    // messages.docs.forEach((element) {
    //   print(element.data());
    // });
    // await for (var snapshot in _store.collection("messages").snapshots()) {
    //   snapshot.docs.forEach((element) {
    //     print(element.data());
    //   });
    // }
    _store.collection("messages").snapshots().listen((event) {
      event.docs.forEach((element) {
        print(element.data());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () async {
                _auth.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, WelcomeScreen.id, (route) => false);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Container(
                    color: Colors.white,
                    child: Center(
                      child: SpinKitCircle(color: Colors.black54),
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Error : ${snapshot.error}"),
                  );
                }
                List<Widget> listMessages = [];
                snapshot.data?.docs.reversed.forEach((element) {
                  String sender = element.data()["sender"];
                  String message = element.data()["text"];

                  listMessages.add(MessageBubble(
                      sender, message, _auth.currentUser?.email == sender));
                });
                return ListView(
                  reverse: true,
                  children: listMessages,
                );
              },
              stream: _store.collection("messages").orderBy("time").snapshots(),
            )),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: textController,
                      onChanged: (value) {
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      // message + email
                      textController.clear();
                      _store.collection("messages").add({
                        "time": DateTime.now(),
                        "text": message,
                        "sender": _auth.currentUser?.email
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
