import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hs_app/application/auth/auth_bloc.dart';
import 'package:hs_app/auth_repository.dart';
import 'package:hs_app/demo_page.dart';
import 'package:hs_app/presentation/auth/auth_view.dart';
import 'package:yeet/yeet.dart';

import 'home_page.dart';
import 'login_page.dart';
import 'presentation/auth/reset_pass_view.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

final yeet = Yeet(
  children: [
    Yeet(
      path: '/home',
      builder: (_, __) => HomePage(),
    ),
    Yeet(
      path: '/',
      builder: (_, __) => AuthView(),
      children: [
        Yeet(
          path: '/reset-pass',
          builder: (_, __) => ResetPassView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ],
    ),
  ],
);

class MyApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Harbour.Space',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        // textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      routeInformationParser: YeetInformationParser(),
      routerDelegate: YeeterDelegate(yeet: yeet),
    );
  }
}
