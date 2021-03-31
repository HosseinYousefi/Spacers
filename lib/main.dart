import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hs_app/presentation/post/post_view.dart';
import 'package:yeet/yeet.dart';

import 'application/auth/auth_bloc.dart';
import 'presentation/animation_page.dart';
import 'presentation/home/home_view.dart';
import 'presentation/auth/auth_view.dart';

final firebaseProvider =
    FutureProvider((_) async => await Firebase.initializeApp());

void main() async {
  Hive.init('/hive');
  runApp(ProviderScope(child: MyApp()));
}

final yeetProvider = Provider<Yeet>((ref) {
  final firebase = ref.watch(firebaseProvider);
  if (firebase.data == null)
    return Yeet(path: '/', builder: (_, __) => Scaffold());
  final authState = ref.watch(authBlocProvider.state);
  return authState.maybeWhen(
    authenticated: (user) => Yeet(
      children: [
        Yeet(
          path: '/',
          builder: (_, __) => HomeView(),
          children: [
            Yeet.custom(
              path: '/post/:id',
              builder: (params, _) => PostView(params['id']!),
              opaque: false,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            ),
          ],
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
        primarySwatch: Colors.deepPurple,
        // textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      routeInformationParser: YeetInformationParser(),
      routerDelegate: YeeterDelegate(yeet: yeet),
    );
  }
}
