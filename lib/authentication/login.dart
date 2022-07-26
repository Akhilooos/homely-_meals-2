import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:homely_meals2/resources/authentication_methods.dart';
import 'package:homely_meals2/utils/utils.dart';
import 'package:homely_meals2/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthenticationMethods authenticationMethods = AuthenticationMethods();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Image.asset(
                'images/seller.png',
                height: 270,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                  data: Icons.email,
                  controller: emailController,
                  hintText: "Email",
                  isObsecre: false,
                ),
                CustomTextField(
                  data: Icons.lock,
                  controller: passwordController,
                  hintText: "Password",
                  isObsecre: true,
                ),
              ],
            ),
          ),
          ElevatedButton(
              child: const Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
              ),
              onPressed: () async {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                  return  LoginScreen();
                } )
                );
                String output = await authenticationMethods.signInuser(
                    email: emailController.text,
                    password: passwordController.text);
                if (output == "success") {
                  //code
                } else {
                  Utils().showSnackBar(context: context, content: output);
                 }
              })
        ],
      ),
    );
  }
}
