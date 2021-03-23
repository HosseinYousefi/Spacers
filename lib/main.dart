import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hs_app/auth_repository.dart';
import 'package:hs_app/demo_page.dart';
import 'package:hs_app/presentation/auth/auth_view.dart';
import 'package:yeet/yeet.dart';

import 'home_page.dart';
import 'login_page.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Harbour.Space',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        // textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: AuthView(),
    );
  }
}
