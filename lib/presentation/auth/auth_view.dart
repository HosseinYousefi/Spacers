import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yeet/yeet.dart';

import '../../application/auth/auth_bloc.dart';
import '../../application/auth/login_bloc.dart';
import '../../common/hs_colors.dart';

class AuthView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final authState = useProvider(authBlocProvider.state);
    final loginState = useProvider(loginBlocProvider.state);
    final loginBloc = useProvider(loginBlocProvider);
    final isMounted = useIsMounted();
    useEffect(() {
      if (isMounted()) {
        loginBloc.hsLogoController.startup();
      }
    }, []);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HSLogo(
              controller: loginBloc.hsLogoController,
            ),
            authState.when(
              loading: () => Center(child: CircularProgressIndicator()),
              authenticated: (user) {
                return Container();
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
                          errorText: loginState.passwordError,
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
      ),
    );
  }
}

enum HSLogoEvent {
  loading,
  stopped,
  error,
  startup,
}

class HSLogoController {
  final StreamController<HSLogoEvent> _streamController;

  HSLogoController() : _streamController = StreamController();

  Stream<HSLogoEvent> watch() {
    return _streamController.stream;
  }

  void loading() {
    finished();
    _streamController.add(HSLogoEvent.loading);
  }

  void finished() {
    _streamController.add(HSLogoEvent.stopped);
  }

  void error() {
    finished();
    _streamController.add(HSLogoEvent.error);
  }

  void startup() {
    finished();
    _streamController.add(HSLogoEvent.startup);
  }

  void dispose() {
    _streamController.close();
  }
}

class HSLogo extends HookWidget {
  final HSLogoController controller;

  HSLogo({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final startupAnimationController =
        useAnimationController(duration: Duration(milliseconds: 3000));
    final bouncingAnimationController =
        useAnimationController(duration: Duration(milliseconds: 300));
    final errorAnimationController =
        useAnimationController(duration: Duration(milliseconds: 300));
    final latestEvent = useState(HSLogoEvent.stopped);
    final isMounted = useIsMounted();
    final errorStatusListener = (AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        errorAnimationController.reverse();
      }
    };
    final bouncingStatusListener = (AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        bouncingAnimationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        bouncingAnimationController.forward();
      }
    };
    useEffect(() {
      final subscription = controller.watch().listen((event) {
        if (isMounted()) {
          if (event == HSLogoEvent.error) {
            errorAnimationController.addStatusListener(errorStatusListener);
            startupAnimationController.value = 1.0;
            errorAnimationController.forward();
            latestEvent.value = event;
          } else if (event == HSLogoEvent.startup) {
            startupAnimationController.value = 0.0;
            startupAnimationController.forward();
          } else if (event == HSLogoEvent.loading) {
            bouncingAnimationController
                .addStatusListener(bouncingStatusListener);
            startupAnimationController.value = 1.0;
            bouncingAnimationController.forward();
            latestEvent.value = event;
          } else if (event == HSLogoEvent.stopped) {
            startupAnimationController.value = 1.0;
            bouncingAnimationController.value = 0.0;
            errorAnimationController.value = 0.0;
            bouncingAnimationController.stop();
            bouncingAnimationController
                .removeStatusListener(bouncingStatusListener);
            errorAnimationController.stop();
            errorAnimationController.removeStatusListener(errorStatusListener);
          }
        }
      });
      return subscription.cancel;
    }, [controller.watch()]);
    final fadeAnimationValue = useAnimation(Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: startupAnimationController,
        curve: Interval(0.5, 1.0, curve: Curves.easeOutCubic),
      ),
    ));
    return Container(
      height: 400,
      child: AlignTransition(
        alignment: latestEvent.value == HSLogoEvent.error
            ? AlignmentTween(
                begin: Alignment(0.0, 0.0),
                end: Alignment(0.2, 0.0),
              ).animate(CurvedAnimation(
                parent: errorAnimationController, curve: Curves.elasticIn))
            : AlignmentTween(
                begin: Alignment(0.0, 0.0),
                end: Alignment(0.0, -0.3),
              ).animate(CurvedAnimation(
                parent: bouncingAnimationController, curve: Curves.ease)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 290,
              width: 290,
              child: ScaleTransition(
                scale: Tween(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                    parent: startupAnimationController,
                    curve: Interval(0.25, 0.5, curve: Curves.easeOutCubic),
                  ),
                ),
                child: Container(
                  height: 290,
                  width: 290,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: HSColors.mainColor,
                  ),
                ),
              ),
            ),
            Opacity(
              opacity: fadeAnimationValue,
              child: Image.asset(
                'assets/HS.png',
                height: 293,
                width: 293,
              ),
            ),
            if (latestEvent.value == HSLogoEvent.loading)
              Container(
                height: 280,
                width: 280,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
