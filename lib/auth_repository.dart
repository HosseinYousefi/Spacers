import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class AuthRepository {
  Future<bool> login();
  // Future<bool> logout();
}

class MockAuthRepository implements AuthRepository {
  @override
  Future<bool> login() async {
    await Future.delayed(Duration(seconds: 5));
    return true;
  }
}

final authRepositoryProvider = Provider((_) => MockAuthRepository());
