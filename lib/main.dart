import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yeet/yeet.dart';

import 'application/auth/auth_bloc.dart';
import 'home_page.dart';
import 'presentation/auth/auth_view.dart';

void main() {
  Hive.init('/hive');
  runApp(ProviderScope(child: MyApp()));
}

final yeetProvider = Provider<Yeet>((ref) {
  final authState = ref.watch(authBlocProvider.state);
  return authState.maybeWhen(
    authenticated: (user) => Yeet(
      children: [
        Yeet(
          path: '/',
          builder: (_, __) => HomePage(),
        ),
      ],
    ),
    orElse: () => Yeet(
      children: [
        Yeet(
          path: '/',
          builder: (_, __) => AuthView(),
        ),
      ],
    ),
  );
});

class MyApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final yeet = useProvider(yeetProvider);
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
