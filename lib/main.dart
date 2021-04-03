import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yeet/yeet.dart';

import 'application/auth/auth_bloc.dart';
import 'presentation/404/view404.dart';
import 'presentation/auth/auth_view.dart';
import 'presentation/home/home_view.dart';
import 'presentation/new_post/new_post_view.dart';
import 'presentation/post/post_view.dart';
import 'presentation/username/username_view.dart';

final firebaseProvider =
    FutureProvider((_) async => await Firebase.initializeApp());

void main() async {
  Hive.init('/hive');
  runApp(ProviderScope(child: MyApp()));
}

final yeetProvider = Provider<Yeet>((ref) {
  final firebase = ref.watch(firebaseProvider);
  if (firebase.data == null)
    return Yeet(
      children: [
        Yeet(path: '/', builder: (_, __) => Scaffold()),
        Yeet(
          path: ':_(.*)',
          builder: (_, __) => View404(),
        ),
      ],
    );
  final authState = ref.watch(authBlocProvider.state);
  return authState.maybeWhen(
    authenticated: (user) {
      if (user.name == '') {
        return Yeet(
          children: [
            Yeet(path: '/', builder: (_, __) => UsernameView()),
            Yeet(
              path: ':_(.*)',
              builder: (_, __) => View404(),
            ),
          ],
        );
      }
      return Yeet(
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
          Yeet(
            path: ':_(.*)',
            builder: (_, __) => View404(),
          ),
        ],
      );
    },
    orElse: () => Yeet(
      children: [
        Yeet(
          path: '/',
          builder: (_, __) => AuthView(),
        ),
        Yeet(
          path: ':_(.*)',
          builder: (_, __) => View404(),
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
      title: 'Spacers',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Apercu Pro',
        // textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      routeInformationParser: YeetInformationParser(),
      routerDelegate: YeeterDelegate(yeet: yeet),
    );
  }
}
