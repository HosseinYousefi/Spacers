import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/auth/auth_repo.dart';
import '../../domain/auth/user.dart';
import 'auth_state.dart';

class AuthBloc extends StateNotifier<AuthState> {
  final AuthRepo _authRepo;
  AuthBloc(this._authRepo) : super(AuthState.loading()) {
    _authRepo.authStateChanges().listen((event) {
      if (event == null) {
        state = AuthState.unauthenticated();
      } else {
        state = AuthState.authenticated(user: event);
      }
    });
  }
}

final authChangesProvider = StreamProvider<User?>((ref) {
  final authRepo = ref.watch(authRepoProvider);
  return authRepo.authStateChanges();
});

final authBlocProvider = StateNotifierProvider<AuthBloc>((ref) {
  final authRepo = ref.watch(authRepoProvider);
  return AuthBloc(authRepo);
});
