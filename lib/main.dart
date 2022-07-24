

import 'package:flutter/material.dart';
import 'package:homely_meals2/splash_screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seller Window',
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: Mysplashscreen(),
    );
  }
}
