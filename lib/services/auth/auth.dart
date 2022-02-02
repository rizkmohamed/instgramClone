
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:instgramclone/services/storage/firestorage.dart';

class ResgisterAuth {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //
  Future<String> registerUser({
    required String name,
    required String bio,
    required String email,
    required String password,
    required Uint8List file,
  }) async {
    var result = 'Some Error';
    try {
      //  check condition
      if (name.isNotEmpty ||
              password.isNotEmpty ||
              bio.isNotEmpty ||
              email.isNotEmpty
          //  ||
          // file != null
          ) {
        // user register
        UserCredential userCred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        if (kDebugMode) {
          print(userCred.user!.uid);
        }
        // get image
        String imageurl =
            await Starage().uploadImageytofirestore('ProfilePick', file, false);
        // set in firestore
        await _firestore.collection('users').doc(userCred.user!.uid).set({
          'name': name,
          'email': email,
          'uuid': userCred.user!.uid,
          'followers': [],
          'following': [],
          'userImageurl': imageurl,
        });
        result = 'Success';
        // await _firestore.collection('users').add({
        //   'name': name,
        //   'email': email,
        //   'uuid': userCred.user!.uid,
        //   'followers': [],
        //   'following': [],
        // });
      }
    } catch (e) {
      result = e.toString();
    }
    return result;
  }
}
