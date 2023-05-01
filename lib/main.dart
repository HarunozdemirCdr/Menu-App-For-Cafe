import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Pages/Welcome_page.dart';
import 'Firebase_Options/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR CODE MENU APP',
      home: welcome_page(),
    );
  }
}
