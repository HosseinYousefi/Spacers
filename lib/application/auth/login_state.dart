import 'package:freezed_annotation/freezed_annotation.dart';
import '../../presentation/auth/auth_view.dart';
part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    required String email,
    required String password,
    String? emailError,
    String? passwordError,
    required bool hasSubmitted,
  }) = _LoginState;
}
