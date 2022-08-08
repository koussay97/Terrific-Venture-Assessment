import 'package:flutter/material.dart';

import 'auth_feature/1-presentation/1.2-screens/login-screen.dart';
import 'company_profile_feature/1-presentation/1-2-screens/company-profile-screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Flutter Assessment',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}

