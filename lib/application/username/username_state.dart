import 'package:freezed_annotation/freezed_annotation.dart';

part 'username_state.freezed.dart';

@freezed
abstract class UsernameState with _$UsernameState {
  const factory UsernameState({
    required bool isLoading,
    required String username,
    required bool buttonEnabled,
    String? usernameError,
  }) = _UsernameState;
}
