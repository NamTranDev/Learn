import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Container(
              child: Center(
                child: Text("Error : ${snapshot.error.toString()}"),
              ),
            );
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return Container(
              color: Colors.white,
            );
          }
          return MaterialApp(
            initialRoute: isLogin() ? ChatScreen.id : WelcomeScreen.id,
            routes: <String, WidgetBuilder>{
              WelcomeScreen.id: (context) => WelcomeScreen(),
              LoginScreen.id: (context) => LoginScreen(),
              RegistrationScreen.id: (context) => RegistrationScreen(),
              ChatScreen.id: (context) => ChatScreen()
            },
          );
        });
  }

  bool isLogin() {
    var _authen = FirebaseAuth.instance;
    if (_authen.currentUser != null) {
      return true;
    }
    return false;
  }
}
