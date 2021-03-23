// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'auth_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthFailureTearOff {
  const _$AuthFailureTearOff();

  _WrongPassword wrongPassword() {
    return const _WrongPassword();
  }

  _UserNotFound userNotFound() {
    return const _UserNotFound();
  }

  GeneralAuthFailure generalAuthFailure() {
    return const GeneralAuthFailure();
  }
}

/// @nodoc
const $AuthFailure = _$AuthFailureTearOff();

/// @nodoc
mixin _$AuthFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() wrongPassword,
    required TResult Function() userNotFound,
    required TResult Function() generalAuthFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? wrongPassword,
    TResult Function()? userNotFound,
    TResult Function()? generalAuthFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WrongPassword value) wrongPassword,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(GeneralAuthFailure value) generalAuthFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WrongPassword value)? wrongPassword,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(GeneralAuthFailure value)? generalAuthFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthFailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(
          AuthFailure value, $Res Function(AuthFailure) then) =
      _$AuthFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthFailureCopyWithImpl<$Res> implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._value, this._then);

  final AuthFailure _value;
  // ignore: unused_field
  final $Res Function(AuthFailure) _then;
}

/// @nodoc
abstract class _$WrongPasswordCopyWith<$Res> {
  factory _$WrongPasswordCopyWith(
          _WrongPassword value, $Res Function(_WrongPassword) then) =
      __$WrongPasswordCopyWithImpl<$Res>;
}

/// @nodoc
class __$WrongPasswordCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
    implements _$WrongPasswordCopyWith<$Res> {
  __$WrongPasswordCopyWithImpl(
      _WrongPassword _value, $Res Function(_WrongPassword) _then)
      : super(_value, (v) => _then(v as _WrongPassword));

  @override
  _WrongPassword get _value => super._value as _WrongPassword;
}

/// @nodoc
class _$_WrongPassword implements _WrongPassword {
  const _$_WrongPassword();

  @override
  String toString() {
    return 'AuthFailure.wrongPassword()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _WrongPassword);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() wrongPassword,
    required TResult Function() userNotFound,
    required TResult Function() generalAuthFailure,
  }) {
    return wrongPassword();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? wrongPassword,
    TResult Function()? userNotFound,
    TResult Function()? generalAuthFailure,
    required TResult orElse(),
  }) {
    if (wrongPassword != null) {
      return wrongPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WrongPassword value) wrongPassword,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(GeneralAuthFailure value) generalAuthFailure,
  }) {
    return wrongPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WrongPassword value)? wrongPassword,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(GeneralAuthFailure value)? generalAuthFailure,
    required TResult orElse(),
  }) {
    if (wrongPassword != null) {
      return wrongPassword(this);
    }
    return orElse();
  }
}

abstract class _WrongPassword implements AuthFailure {
  const factory _WrongPassword() = _$_WrongPassword;
}

/// @nodoc
abstract class _$UserNotFoundCopyWith<$Res> {
  factory _$UserNotFoundCopyWith(
          _UserNotFound value, $Res Function(_UserNotFound) then) =
      __$UserNotFoundCopyWithImpl<$Res>;
}

/// @nodoc
class __$UserNotFoundCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
    implements _$UserNotFoundCopyWith<$Res> {
  __$UserNotFoundCopyWithImpl(
      _UserNotFound _value, $Res Function(_UserNotFound) _then)
      : super(_value, (v) => _then(v as _UserNotFound));

  @override
  _UserNotFound get _value => super._value as _UserNotFound;
}

/// @nodoc
class _$_UserNotFound implements _UserNotFound {
  const _$_UserNotFound();

  @override
  String toString() {
    return 'AuthFailure.userNotFound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _UserNotFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() wrongPassword,
    required TResult Function() userNotFound,
    required TResult Function() generalAuthFailure,
  }) {
    return userNotFound();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? wrongPassword,
    TResult Function()? userNotFound,
    TResult Function()? generalAuthFailure,
    required TResult orElse(),
  }) {
    if (userNotFound != null) {
      return userNotFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WrongPassword value) wrongPassword,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(GeneralAuthFailure value) generalAuthFailure,
  }) {
    return userNotFound(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WrongPassword value)? wrongPassword,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(GeneralAuthFailure value)? generalAuthFailure,
    required TResult orElse(),
  }) {
    if (userNotFound != null) {
      return userNotFound(this);
    }
    return orElse();
  }
}

abstract class _UserNotFound implements AuthFailure {
  const factory _UserNotFound() = _$_UserNotFound;
}

/// @nodoc
abstract class $GeneralAuthFailureCopyWith<$Res> {
  factory $GeneralAuthFailureCopyWith(
          GeneralAuthFailure value, $Res Function(GeneralAuthFailure) then) =
      _$GeneralAuthFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$GeneralAuthFailureCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements $GeneralAuthFailureCopyWith<$Res> {
  _$GeneralAuthFailureCopyWithImpl(
      GeneralAuthFailure _value, $Res Function(GeneralAuthFailure) _then)
      : super(_value, (v) => _then(v as GeneralAuthFailure));

  @override
  GeneralAuthFailure get _value => super._value as GeneralAuthFailure;
}

/// @nodoc
class _$GeneralAuthFailure implements GeneralAuthFailure {
  const _$GeneralAuthFailure();

  @override
  String toString() {
    return 'AuthFailure.generalAuthFailure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GeneralAuthFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() wrongPassword,
    required TResult Function() userNotFound,
    required TResult Function() generalAuthFailure,
  }) {
    return generalAuthFailure();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? wrongPassword,
    TResult Function()? userNotFound,
    TResult Function()? generalAuthFailure,
    required TResult orElse(),
  }) {
    if (generalAuthFailure != null) {
      return generalAuthFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WrongPassword value) wrongPassword,
    required TResult Function(_UserNotFound value) userNotFound,
    required TResult Function(GeneralAuthFailure value) generalAuthFailure,
  }) {
    return generalAuthFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WrongPassword value)? wrongPassword,
    TResult Function(_UserNotFound value)? userNotFound,
    TResult Function(GeneralAuthFailure value)? generalAuthFailure,
    required TResult orElse(),
  }) {
    if (generalAuthFailure != null) {
      return generalAuthFailure(this);
    }
    return orElse();
  }
}

abstract class GeneralAuthFailure implements AuthFailure {
  const factory GeneralAuthFailure() = _$GeneralAuthFailure;
}
