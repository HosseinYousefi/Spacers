import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/auth/auth_repo.dart';
import '../../domain/username/username_repo.dart';
import 'username_state.dart';

class UsernameBloc extends StateNotifier<UsernameState> {
  final UsernameRepo _usernameRepo;
  final AuthRepo _authRepo;

  UsernameBloc(this._usernameRepo, this._authRepo)
      : super(UsernameState(
          isLoading: false,
          username: '',
          buttonEnabled: false,
        ));

  Future<void> usernameChanged(String username) async {
    state = state.copyWith(username: username, buttonEnabled: false);
    final isAvailable = await _usernameRepo.isAvailable(username);
    state = state.copyWith(
        buttonEnabled: isAvailable,
        usernameError: isAvailable ? null : 'This username already exists!');
  }

  Future<void> letsGoPressed() async {
    if (state.buttonEnabled) {
      state = state.copyWith(isLoading: true);
      await _usernameRepo.changeUsername(state.username);
      state = state.copyWith(isLoading: false);
      _authRepo.nameAdded(state.username);
    }
  }
}

final usernameBlocProvider = StateNotifierProvider<UsernameBloc>((ref) {
  final usernameRepo = ref.watch(usernameRepoProvider);
  final authRepo = ref.watch(authRepoProvider);
  return UsernameBloc(usernameRepo, authRepo);
});
