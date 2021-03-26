import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hs_app/application/auth/auth_bloc.dart';
import 'package:hs_app/application/auth/login_bloc.dart';
import 'package:hs_app/common/hs_colors.dart';
import 'package:yeet/yeet.dart';

class AuthView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final authState = useProvider(authBlocProvider.state);
    final loginState = useProvider(loginBlocProvider.state);
    final loginBloc = useProvider(loginBlocProvider);
    // ternary operator:
    // condition ? ifitstrue : ifitsfalse
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/HS.png'),
          authState.when(
            loading: () => Center(child: CircularProgressIndicator()),
            authenticated: (user) {
              Future.delayed(Duration(milliseconds: 300)).then((_) {
                context.yeet('/home');
              });
              return Center(child: Text('Welcome ${user.id}'));
            },
            unauthenticated: () => Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      onChanged: (value) {
                        loginBloc.emailChanged(value);
                      },
                      decoration: InputDecoration(
                        errorText: loginState.emailError,
                        border: OutlineInputBorder(),
                        hintText: 'Email',
                      ),
                    ),
                    SizedBox(height: 24),
                    TextField(
                      obscureText: true,
                      onChanged: (value) {
                        loginBloc.passwordChanged(value);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                      ),
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        loginBloc.loginPressed();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                          (_) => HSColors.mainColor,
                        ),
                      ),
                      child: Text('Sign in'),
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        loginBloc.registerPressed();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                          (_) => HSColors.mainColor,
                        ),
                      ),
                      child: Text('Register'),
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
