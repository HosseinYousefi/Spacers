import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/auth/auth_repo.dart';
import 'auth_state.dart';

class AuthBloc extends StateNotifier<AuthState> {
  final AuthRepo authRepo;

  AuthBloc(this.authRepo) : super(AuthState.unauthenticated());

  Future<void> loginButtonPressed() async {
    state = AuthState.loading();
    final failureOrUser = await authRepo.login();
    failureOrUser.fold(
      (failure) => state = AuthState.failed(failure: failure),
      (user) => state = AuthState.authenticated(user: user),
    );
  }
}

final authBlocProvider = StateNotifierProvider<AuthBloc>((ref) {
  final authRepo = ref.watch(authRepoProvider);
  return AuthBloc(authRepo);
});
