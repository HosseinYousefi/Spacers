// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'joke.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Joke _$JokeFromJson(Map<String, dynamic> json) {
  return _Joke.fromJson(json);
}

/// @nodoc
class _$JokeTearOff {
  const _$JokeTearOff();

  _Joke call({required String joke}) {
    return _Joke(
      joke: joke,
    );
  }

  Joke fromJson(Map<String, Object> json) {
    return Joke.fromJson(json);
  }
}

/// @nodoc
const $Joke = _$JokeTearOff();

/// @nodoc
mixin _$Joke {
  String get joke => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JokeCopyWith<Joke> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JokeCopyWith<$Res> {
  factory $JokeCopyWith(Joke value, $Res Function(Joke) then) =
      _$JokeCopyWithImpl<$Res>;
  $Res call({String joke});
}

/// @nodoc
class _$JokeCopyWithImpl<$Res> implements $JokeCopyWith<$Res> {
  _$JokeCopyWithImpl(this._value, this._then);

  final Joke _value;
  // ignore: unused_field
  final $Res Function(Joke) _then;

  @override
  $Res call({
    Object? joke = freezed,
  }) {
    return _then(_value.copyWith(
      joke: joke == freezed
          ? _value.joke
          : joke // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$JokeCopyWith<$Res> implements $JokeCopyWith<$Res> {
  factory _$JokeCopyWith(_Joke value, $Res Function(_Joke) then) =
      __$JokeCopyWithImpl<$Res>;
  @override
  $Res call({String joke});
}

/// @nodoc
class __$JokeCopyWithImpl<$Res> extends _$JokeCopyWithImpl<$Res>
    implements _$JokeCopyWith<$Res> {
  __$JokeCopyWithImpl(_Joke _value, $Res Function(_Joke) _then)
      : super(_value, (v) => _then(v as _Joke));

  @override
  _Joke get _value => super._value as _Joke;

  @override
  $Res call({
    Object? joke = freezed,
  }) {
    return _then(_Joke(
      joke: joke == freezed
          ? _value.joke
          : joke // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Joke implements _Joke {
  const _$_Joke({required this.joke});

  factory _$_Joke.fromJson(Map<String, dynamic> json) =>
      _$_$_JokeFromJson(json);

  @override
  final String joke;

  @override
  String toString() {
    return 'Joke(joke: $joke)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Joke &&
            (identical(other.joke, joke) ||
                const DeepCollectionEquality().equals(other.joke, joke)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(joke);

  @JsonKey(ignore: true)
  @override
  _$JokeCopyWith<_Joke> get copyWith =>
      __$JokeCopyWithImpl<_Joke>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_JokeToJson(this);
  }
}

abstract class _Joke implements Joke {
  const factory _Joke({required String joke}) = _$_Joke;

  factory _Joke.fromJson(Map<String, dynamic> json) = _$_Joke.fromJson;

  @override
  String get joke => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$JokeCopyWith<_Joke> get copyWith => throw _privateConstructorUsedError;
}
