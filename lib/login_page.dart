import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'auth_repository.dart';

class LoginPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final waiting = useState(false);
    final authRepository = useProvider(authRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: waiting.value
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () async {
                  print('I am being pressed!');
                  waiting.value = true;
                  final result = await authRepository.login();
                  waiting.value = false;
                  if (result) {
                    print('you logged in!');
                  } else {
                    print('some error!');
                  }
                },
                child: Text('Login'),
              ),
      ),
    );
  }
}
