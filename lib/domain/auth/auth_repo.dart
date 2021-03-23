import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hs_app/domain/auth/auth_failure.dart';
import 'package:hs_app/infrastructure/auth/mock_auth_service.dart';

import 'user.dart';

class AuthRepo {
  final MockAuthService authService;

  AuthRepo(this.authService);

  Future<Either<AuthFailure, User>> login() async {
    try {
      final result = await authService.login();
      return right(User(id: result['userid'], userName: result['username']));
    } catch (_) {
      print('error happened');
      return left(GeneralAuthFailure());
    }
  }

  Future<Either<AuthFailure, Unit>> logout() async {
    try {
      final result = await authService.logout();
      if (result) {
        return right(unit);
      } else {
        return left(GeneralAuthFailure());
      }
    } catch (_) {
      return left(GeneralAuthFailure());
    }
  }
}

final authRepoProvider = Provider<AuthRepo>((ref) {
  final mockAuthService = ref.watch(mockAuthServiceProvider);
  return AuthRepo(mockAuthService);
});
