import 'package:flutter/material.dart';
import 'package:hs_app/login_page.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Harbour.Space',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        // textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: LoginPage(),
    );
  }
}
