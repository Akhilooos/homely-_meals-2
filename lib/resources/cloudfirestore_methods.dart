

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CloudFirestoreClass {
  FirebaseFirestore firebasefirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future uploadData({required String name, required String email}) async {
    await firebasefirestore
        .collection("Users")
        .doc(firebaseAuth.currentUser!.uid)
        .set({
      "Name": name,
      "Email": email,
    });
  }
}
