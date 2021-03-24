import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/auth/auth_repo.dart';
import 'auth_state.dart';

class AuthBloc extends StateNotifier<AuthState> {
  final AuthRepo authRepo;

  AuthBloc(this.authRepo)
      : super(AuthState.unauthenticated(
          userName: '',
          password: '',
        ));

  Future<void> loginButtonPressed() async {
    state = AuthState.loading();
    final failureOrUser = await authRepo.login();
    failureOrUser.fold(
      (failure) => state = AuthState.failed(failure: failure),
      (user) => state = AuthState.authenticated(user: user),
    );
  }

  void userNameChanged(String userName) {
    state.maybeMap(
      unauthenticated: (value) {
        String? errorMessage;
        if (userName.length > 10) {
          errorMessage = 'The password is too long.';
        }
        state = value.copyWith(
          userName: userName,
          userError: errorMessage,
        );
      },
      orElse: () {},
    );
  }

  void passwordChanged(String password) {
    state.maybeMap(
      unauthenticated: (value) {
        state = value.copyWith(password: password);
      },
      orElse: () {},
    );
  }
}

final authBlocProvider = StateNotifierProvider<AuthBloc>((ref) {
  final authRepo = ref.watch(authRepoProvider);
  return AuthBloc(authRepo);
});
