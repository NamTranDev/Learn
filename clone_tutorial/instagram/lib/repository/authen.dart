import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';

class Authen {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  signUpUser({
    required String userName,
    required String email,
    required String pass,
    required String bio,
    required Uint8List avarta,
  }) {}
}
