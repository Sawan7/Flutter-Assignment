import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projectauth/language_screen.dart';
import 'package:projectauth/otp_screen.dart';
import 'package:projectauth/profile_screen.dart';

import 'package:projectauth/verifiy_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LanguageScreen(),
        'phone': (context) => const VerifiyScreen(),
        'Verify': (context) =>  OtpScreen(),
        'Otp': (context) => OtpScreen(),
        'Profile':(context)=> const ProfileScreen()
      },
    );
  }
}
