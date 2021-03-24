import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hs_app/domain/auth/auth_failure.dart';

import '../../domain/auth/user.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.unauthenticated({
    required String userName,
    required String password,
    String? userError,
  }) = _Unathenticated;
  const factory AuthState.failed({
    required AuthFailure failure,
  }) = _Failed;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated({
    required User user,
  }) = Authenticated;
}
