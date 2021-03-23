import 'package:hooks_riverpod/hooks_riverpod.dart';

class MockAuthService {
  Future<Map<String, dynamic>> login() async {
    // sometimes it could be
    await Future.delayed(Duration(seconds: 3));
    // throw Error();
    return {
      'userid': 1892,
      'username': 'alex',
    };
  }

  Future<bool> logout() async {
    await Future.delayed(Duration(seconds: 3));
    return true;
  }
}

final mockAuthServiceProvider = Provider((_) => MockAuthService());
