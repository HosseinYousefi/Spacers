import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/username/username_bloc.dart';
import '../common/texts.dart';

class UsernameView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final usernameState = useProvider(usernameBlocProvider.state);
    final usernameBloc = useProvider(usernameBlocProvider);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: usernameState.isLoading
              ? CircularProgressIndicator()
              : Column(
                  children: [
                    SizedBox(height: 20),
                    Heading('Welcome to Spacers!'),
                    Spacer(),
                    FractionallySizedBox(
                      widthFactor: 0.5,
                      child: TextField(
                        onChanged: (value) =>
                            usernameBloc.usernameChanged(value),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Choose your username!',
                          errorText: usernameState.username != ''
                              ? usernameState.usernameError
                              : null,
                          prefixText: '@',
                        ),
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: usernameState.buttonEnabled
                          ? usernameBloc.letsGoPressed
                          : null,
                      child: Text('Let\'s go!'),
                    ),
                    Spacer(),
                  ],
                ),
        ),
      ),
    );
  }
}
