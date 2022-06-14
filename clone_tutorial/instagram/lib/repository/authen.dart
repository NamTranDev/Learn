import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Authen {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String userName,
    required String email,
    required String pass,
    required String bio,
    // required Uint8List avarta,
  }) async {
    String res = "";
    try {
      if (email.isNotEmpty ||
          pass.isNotEmpty ||
          userName.isNotEmpty ||
          bio.isNotEmpty) {
        //register user
        UserCredential user = await _auth.createUserWithEmailAndPassword(
            email: email, password: pass);
        print(user.toString());
        // add user to database
        //store with id of user firebase
        _store.collection('users').doc(user.user?.uid).set({
          'username': userName,
          'uid': user.user?.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': []
        });

        //store with random id store
        // await _store.collection('users').add({
        //   'username': userName,
        //   'uid': user.user?.uid,
        //   'email': email,
        //   'bio': bio,
        //   'followers': [],
        //   'following': []
        // });

        res = 'success';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
