import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Starage {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  // store image to fire store
  Future<String> uploadImageytofirestore(
      String childName, Uint8List file, bool ispost) async {
    Reference ref =
        _firebaseStorage.ref().child(childName).child(_auth.currentUser!.uid);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downLoadUrlImage = await snapshot.ref.getDownloadURL();
    return downLoadUrlImage;
  }
}
