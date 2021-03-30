import 'package:email_validator/email_validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hs_app/application/auth/auth_bloc.dart';
import 'package:hs_app/domain/auth/auth_repo.dart';
import '../../presentation/auth/auth_view.dart';

import 'login_state.dart';

class LoginBloc extends StateNotifier<LoginState> {
  final AuthRepo _authRepo;
  final HSLogoController hsLogoController;

  LoginBloc(this._authRepo)
      : hsLogoController = HSLogoController(),
        super(LoginState(
          email: '',
          password: '',
          hasSubmitted: false,
        ));

  void emailChanged(String email) {
    final isValid = !state.hasSubmitted || EmailValidator.validate(email);
    state = state.copyWith(
        email: email,
        emailError: isValid ? null : 'Please enter a valid email!');
  }

  void passwordChanged(String password) {
    final isValid = !state.hasSubmitted || password.length > 6;
    state = state.copyWith(
        password: password,
        passwordError: isValid
            ? null
            : 'The length of the password should be at least 7 characters.');
  }

  void _submit() {
    state = state.copyWith(hasSubmitted: true);
    emailChanged(state.email);
    passwordChanged(state.password);
  }

  Future<void> loginPressed() async {
    _submit();
    if (state.emailError == null && state.passwordError == null) {
      hsLogoController.loading();
      await Future.delayed(Duration(seconds: 5));
      final result = await _authRepo.login(state.email, state.password);
      result.fold(
        (failure) {
          hsLogoController.error();
        },
        (r) {
          hsLogoController.finished();
        },
      );
    } else {
      print('happening');
      hsLogoController.error();
    }
  }

  void registerPressed() {
    _submit();
    if (state.emailError == null && state.passwordError == null) {
      _authRepo.register(state.email, state.password);
    } else {
      hsLogoController.error();
    }
  }
}

final loginBlocProvider = StateNotifierProvider.autoDispose<LoginBloc>((ref) {
  final _authRepo = ref.watch(authRepoProvider);
  return LoginBloc(_authRepo);
});
