import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String sender;
  final String message;
  final bool isCurrentUser;

  const MessageBubble(this.sender, this.message, this.isCurrentUser);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment:
              isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            if (!isCurrentUser)
              Padding(
                padding: EdgeInsets.only(bottom: 2, right: 10),
                child: Text(
                  sender,
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              )
            else
              SizedBox(),
            Material(
              elevation: 5,
              color: isCurrentUser ? Colors.lightBlue.shade200 : Colors.white,
              borderRadius: isCurrentUser
                  ? BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))
                  : BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  message,
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                ),
              ),
            ),
          ],
        ));
  }
}
