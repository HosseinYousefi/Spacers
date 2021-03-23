import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hs_app/application/auth/auth_bloc.dart';
import 'package:yeet/yeet.dart';

class AuthView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final authState = useProvider(authBlocProvider.state);
    final authBloc = useProvider(authBlocProvider);
    // ternary operator:
    // condition ? ifitstrue : ifitsfalse
    return Scaffold(
      body: authState.when(
        loading: () => Center(child: CircularProgressIndicator()),
        failed: (failure) => Center(
          child: Text(failure.when(
            wrongPassword: () => 'Wrong Password!',
            userNotFound: () => 'User not found!',
            generalAuthFailure: () => 'Server error, please try again!',
          )),
        ),
        authenticated: (user) => Builder(builder: (context) {
          return Text('welcome ${user.userName}');
        }),
        unauthenticated: () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  authBloc.loginButtonPressed();
                },
                child: Text('log in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
