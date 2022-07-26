import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationMethods {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<String> signUpuser(
      {required String name,
      required String email,
      required String phone,
      required String password,
      required String confirmPassword,
      required String location}) async {
    email.trim();
    phone.trim();
    password.trim();
    confirmPassword.trim();
    String output = "Something went wrong";
    if (name != "" &&
        email != "" &&
        password != "" &&
        phone != "" &&
        confirmPassword != "" &&
        location != "") {
      try {
        await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
      } catch (e) {
        output = e.toString();
      }
      output = "success";
    } else {
      output = "Please fill up all the details";
    }
    return output;
  }

  Future<String> signInuser(
      {
      required String email,
      required String password,}) async {
    email.trim();
    password.trim();
    String output = "Something went wrong";
    if (
        email != "" &&
        password != "" 
        )
         {
      try {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
      } catch (e) {
        output = e.toString();
      }
      output = "success";
    } else {
      output = "Please fill up all the details";
    }
    return output;
  }
}
