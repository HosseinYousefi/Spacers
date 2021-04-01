// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'username_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UsernameStateTearOff {
  const _$UsernameStateTearOff();

  _UsernameState call(
      {required bool isLoading,
      required String username,
      required bool buttonEnabled,
      String? usernameError}) {
    return _UsernameState(
      isLoading: isLoading,
      username: username,
      buttonEnabled: buttonEnabled,
      usernameError: usernameError,
    );
  }
}

/// @nodoc
const $UsernameState = _$UsernameStateTearOff();

/// @nodoc
mixin _$UsernameState {
  bool get isLoading => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  bool get buttonEnabled => throw _privateConstructorUsedError;
  String? get usernameError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UsernameStateCopyWith<UsernameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsernameStateCopyWith<$Res> {
  factory $UsernameStateCopyWith(
          UsernameState value, $Res Function(UsernameState) then) =
      _$UsernameStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      String username,
      bool buttonEnabled,
      String? usernameError});
}

/// @nodoc
class _$UsernameStateCopyWithImpl<$Res>
    implements $UsernameStateCopyWith<$Res> {
  _$UsernameStateCopyWithImpl(this._value, this._then);

  final UsernameState _value;
  // ignore: unused_field
  final $Res Function(UsernameState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? username = freezed,
    Object? buttonEnabled = freezed,
    Object? usernameError = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      buttonEnabled: buttonEnabled == freezed
          ? _value.buttonEnabled
          : buttonEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      usernameError: usernameError == freezed
          ? _value.usernameError
          : usernameError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$UsernameStateCopyWith<$Res>
    implements $UsernameStateCopyWith<$Res> {
  factory _$UsernameStateCopyWith(
          _UsernameState value, $Res Function(_UsernameState) then) =
      __$UsernameStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      String username,
      bool buttonEnabled,
      String? usernameError});
}

/// @nodoc
class __$UsernameStateCopyWithImpl<$Res>
    extends _$UsernameStateCopyWithImpl<$Res>
    implements _$UsernameStateCopyWith<$Res> {
  __$UsernameStateCopyWithImpl(
      _UsernameState _value, $Res Function(_UsernameState) _then)
      : super(_value, (v) => _then(v as _UsernameState));

  @override
  _UsernameState get _value => super._value as _UsernameState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? username = freezed,
    Object? buttonEnabled = freezed,
    Object? usernameError = freezed,
  }) {
    return _then(_UsernameState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      buttonEnabled: buttonEnabled == freezed
          ? _value.buttonEnabled
          : buttonEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      usernameError: usernameError == freezed
          ? _value.usernameError
          : usernameError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
class _$_UsernameState implements _UsernameState {
  const _$_UsernameState(
      {required this.isLoading,
      required this.username,
      required this.buttonEnabled,
      this.usernameError});

  @override
  final bool isLoading;
  @override
  final String username;
  @override
  final bool buttonEnabled;
  @override
  final String? usernameError;

  @override
  String toString() {
    return 'UsernameState(isLoading: $isLoading, username: $username, buttonEnabled: $buttonEnabled, usernameError: $usernameError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UsernameState &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.buttonEnabled, buttonEnabled) ||
                const DeepCollectionEquality()
                    .equals(other.buttonEnabled, buttonEnabled)) &&
            (identical(other.usernameError, usernameError) ||
                const DeepCollectionEquality()
                    .equals(other.usernameError, usernameError)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(buttonEnabled) ^
      const DeepCollectionEquality().hash(usernameError);

  @JsonKey(ignore: true)
  @override
  _$UsernameStateCopyWith<_UsernameState> get copyWith =>
      __$UsernameStateCopyWithImpl<_UsernameState>(this, _$identity);
}

abstract class _UsernameState implements UsernameState {
  const factory _UsernameState(
      {required bool isLoading,
      required String username,
      required bool buttonEnabled,
      String? usernameError}) = _$_UsernameState;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  String get username => throw _privateConstructorUsedError;
  @override
  bool get buttonEnabled => throw _privateConstructorUsedError;
  @override
  String? get usernameError => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UsernameStateCopyWith<_UsernameState> get copyWith =>
      throw _privateConstructorUsedError;
}
