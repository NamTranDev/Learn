import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';

class ChatScreen extends StatefulWidget {
  static const id = "Chat Screen";

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _store = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

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
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () async {
                _auth.signOut();
                Navigator.pop(context);
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
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Text("Not found chat data"),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Error : ${snapshot.error}"),
                  );
                }
                List<Text> listMessages = [];
                snapshot.data?.docs.forEach((element) {
                  listMessages.add(Text(
                      "${element.data()["sender"]}  send  ${element.data()["text"]}"));
                });
                return Column(
                  children: listMessages,
                );
              },
              stream: _store.collection("messages").snapshots(),
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      // message + email
                      _store.collection("messages").add({
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
