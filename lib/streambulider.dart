import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homely_meals2/authentication/auth_screen.dart';

class streamBuilder extends StatefulWidget {
  streamBuilder({Key? key}) : super(key: key);

  @override
  State<streamBuilder> createState() => _streamBuilderState();
}

class _streamBuilderState extends State<streamBuilder> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, AsyncSnapshot<User?> user) {
          if (user.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.lightBlue,
              ),
            );
          } else if (user.hasData) {
            //print("uid - ${FirebaseAuth.instance.currentUser!.uid}");
            return ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Text("Sign Out"));
            //return Text("Signed in");
          }
          return AuthScreen();
        });
  }
}
