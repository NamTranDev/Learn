import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Storage {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // add image to firebase storage
  Future<String> uploadImageToStorage(
      String childName, Uint8List file, bool isPost) async {
    Reference ref =
        _storage.ref().child(childName).child(_auth.currentUser?.uid ?? '');
    UploadTask task = ref.putData(file);
    TaskSnapshot snap = await task;
    return await snap.ref.getDownloadURL();
  }
}
