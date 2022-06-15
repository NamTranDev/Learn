import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:instagram/repository/storage.dart';

class Authen {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String userName,
    required String email,
    required String pass,
    required String bio,
    required Uint8List? avarta,
  }) async {
    String res = "";
    // await Future.delayed(Duration(seconds: 2));
    try {
      if (userName.isEmpty) {
        res = 'Please enter username field';
        return res;
      }
      if (email.isEmpty) {
        res = 'Please enter email field';
        return res;
      }
      if (pass.isEmpty) {
        res = 'Please enter password field';
        return res;
      }
      if (bio.isEmpty) {
        res = 'Please enter bio field';
        return res;
      }
      if (avarta == null) {
        res = 'Please enter select avarta';
        return res;
      }
      //register user
      UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      print(user.toString());

      String photoUrl =
          await Storage().uploadImageToStorage('profilePics', avarta!, false);

      // add user to database
      //store with id of user firebase
      _store.collection('users').doc(user.user?.uid).set({
        'username': userName,
        'uid': user.user?.uid,
        'email': email,
        'bio': bio,
        'followers': [],
        'following': [],
        'photoUrl': photoUrl
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
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        res = 'The email is badly formatted';
      } else if (err.code == 'weak-password') {
        res = 'Password should be at least 6 characters';
      } else {
        res = err.message ?? err.toString();
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = '';

    try {
      if (email.isEmpty) {
        res = 'Please enter email field';
        return res;
      }
      if (password.isEmpty) {
        res = 'Please enter password field';
        return res;
      }
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      res = 'success';
    } on FirebaseAuthException catch (err) {
      print(err);
      if (err.code == 'user-not-found') {
        res = 'Not found user';
      } else if (err.code == 'wrong-password') {
        res = 'Wrong password';
      } else {
        res = err.message ?? err.toString();
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
