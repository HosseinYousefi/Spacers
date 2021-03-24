import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hs_app/application/auth/auth_bloc.dart';
import 'package:hs_app/common/hs_colors.dart';
import 'package:yeet/yeet.dart';

class AuthView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final authState = useProvider(authBlocProvider.state);
    final authBloc = useProvider(authBlocProvider);
    // ternary operator:
    // condition ? ifitstrue : ifitsfalse
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/HS.png'),
          authState.when(
            loading: () => Center(child: CircularProgressIndicator()),
            failed: (failure) => Center(
              child: Text(failure.when(
                wrongPassword: () => 'Wrong Password!',
                userNotFound: () => 'User not found!',
                generalAuthFailure: () => 'Server error, please try again!',
              )),
            ),
            authenticated: (user) {
              Future.delayed(Duration(milliseconds: 300)).then((_) {
                context.yeet('/home');
              });
              return Center(child: Text('Welcome ${user.userName}'));
            },
            unauthenticated: (userName, password, userError) => Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      onChanged: (value) {
                        authBloc.userNameChanged(value);
                      },
                      decoration: InputDecoration(
                        errorText: userError,
                        border: OutlineInputBorder(),
                        hintText: 'Username',
                      ),
                    ),
                    SizedBox(height: 24),
                    TextField(
                      obscureText: true,
                      onChanged: (value) {
                        authBloc.passwordChanged(value);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                      ),
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        authBloc.loginButtonPressed();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                          (_) => HSColors.mainColor,
                        ),
                      ),
                      child: Text('Sign in'),
                    ),
                    SizedBox(height: 24),
                    TextButton(
                        onPressed: () {
                          context.yeet('/reset-pass');
                        },
                        child: Text('Forgot password?'))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
