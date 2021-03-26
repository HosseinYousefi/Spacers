import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    required String email,
    required String password,
    String? emailError,
    String? passwordError,
  }) = _LoginState;
}
