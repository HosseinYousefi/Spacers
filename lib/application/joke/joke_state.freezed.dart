// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'joke_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$JokeStateTearOff {
  const _$JokeStateTearOff();

  NoJoke noJoke() {
    return const NoJoke();
  }

  JokeLoading loading() {
    return const JokeLoading();
  }

  HasJoke hasJoke({required Joke joke, required bool isLiked}) {
    return HasJoke(
      joke: joke,
      isLiked: isLiked,
    );
  }
}

/// @nodoc
const $JokeState = _$JokeStateTearOff();

/// @nodoc
mixin _$JokeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noJoke,
    required TResult Function() loading,
    required TResult Function(Joke joke, bool isLiked) hasJoke,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noJoke,
    TResult Function()? loading,
    TResult Function(Joke joke, bool isLiked)? hasJoke,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoJoke value) noJoke,
    required TResult Function(JokeLoading value) loading,
    required TResult Function(HasJoke value) hasJoke,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoJoke value)? noJoke,
    TResult Function(JokeLoading value)? loading,
    TResult Function(HasJoke value)? hasJoke,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JokeStateCopyWith<$Res> {
  factory $JokeStateCopyWith(JokeState value, $Res Function(JokeState) then) =
      _$JokeStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$JokeStateCopyWithImpl<$Res> implements $JokeStateCopyWith<$Res> {
  _$JokeStateCopyWithImpl(this._value, this._then);

  final JokeState _value;
  // ignore: unused_field
  final $Res Function(JokeState) _then;
}

/// @nodoc
abstract class $NoJokeCopyWith<$Res> {
  factory $NoJokeCopyWith(NoJoke value, $Res Function(NoJoke) then) =
      _$NoJokeCopyWithImpl<$Res>;
}

/// @nodoc
class _$NoJokeCopyWithImpl<$Res> extends _$JokeStateCopyWithImpl<$Res>
    implements $NoJokeCopyWith<$Res> {
  _$NoJokeCopyWithImpl(NoJoke _value, $Res Function(NoJoke) _then)
      : super(_value, (v) => _then(v as NoJoke));

  @override
  NoJoke get _value => super._value as NoJoke;
}

/// @nodoc
class _$NoJoke implements NoJoke {
  const _$NoJoke();

  @override
  String toString() {
    return 'JokeState.noJoke()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NoJoke);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noJoke,
    required TResult Function() loading,
    required TResult Function(Joke joke, bool isLiked) hasJoke,
  }) {
    return noJoke();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noJoke,
    TResult Function()? loading,
    TResult Function(Joke joke, bool isLiked)? hasJoke,
    required TResult orElse(),
  }) {
    if (noJoke != null) {
      return noJoke();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoJoke value) noJoke,
    required TResult Function(JokeLoading value) loading,
    required TResult Function(HasJoke value) hasJoke,
  }) {
    return noJoke(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoJoke value)? noJoke,
    TResult Function(JokeLoading value)? loading,
    TResult Function(HasJoke value)? hasJoke,
    required TResult orElse(),
  }) {
    if (noJoke != null) {
      return noJoke(this);
    }
    return orElse();
  }
}

abstract class NoJoke implements JokeState {
  const factory NoJoke() = _$NoJoke;
}

/// @nodoc
abstract class $JokeLoadingCopyWith<$Res> {
  factory $JokeLoadingCopyWith(
          JokeLoading value, $Res Function(JokeLoading) then) =
      _$JokeLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$JokeLoadingCopyWithImpl<$Res> extends _$JokeStateCopyWithImpl<$Res>
    implements $JokeLoadingCopyWith<$Res> {
  _$JokeLoadingCopyWithImpl(
      JokeLoading _value, $Res Function(JokeLoading) _then)
      : super(_value, (v) => _then(v as JokeLoading));

  @override
  JokeLoading get _value => super._value as JokeLoading;
}

/// @nodoc
class _$JokeLoading implements JokeLoading {
  const _$JokeLoading();

  @override
  String toString() {
    return 'JokeState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is JokeLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noJoke,
    required TResult Function() loading,
    required TResult Function(Joke joke, bool isLiked) hasJoke,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noJoke,
    TResult Function()? loading,
    TResult Function(Joke joke, bool isLiked)? hasJoke,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoJoke value) noJoke,
    required TResult Function(JokeLoading value) loading,
    required TResult Function(HasJoke value) hasJoke,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoJoke value)? noJoke,
    TResult Function(JokeLoading value)? loading,
    TResult Function(HasJoke value)? hasJoke,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class JokeLoading implements JokeState {
  const factory JokeLoading() = _$JokeLoading;
}

/// @nodoc
abstract class $HasJokeCopyWith<$Res> {
  factory $HasJokeCopyWith(HasJoke value, $Res Function(HasJoke) then) =
      _$HasJokeCopyWithImpl<$Res>;
  $Res call({Joke joke, bool isLiked});

  $JokeCopyWith<$Res> get joke;
}

/// @nodoc
class _$HasJokeCopyWithImpl<$Res> extends _$JokeStateCopyWithImpl<$Res>
    implements $HasJokeCopyWith<$Res> {
  _$HasJokeCopyWithImpl(HasJoke _value, $Res Function(HasJoke) _then)
      : super(_value, (v) => _then(v as HasJoke));

  @override
  HasJoke get _value => super._value as HasJoke;

  @override
  $Res call({
    Object? joke = freezed,
    Object? isLiked = freezed,
  }) {
    return _then(HasJoke(
      joke: joke == freezed
          ? _value.joke
          : joke // ignore: cast_nullable_to_non_nullable
              as Joke,
      isLiked: isLiked == freezed
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $JokeCopyWith<$Res> get joke {
    return $JokeCopyWith<$Res>(_value.joke, (value) {
      return _then(_value.copyWith(joke: value));
    });
  }
}

/// @nodoc
class _$HasJoke implements HasJoke {
  const _$HasJoke({required this.joke, required this.isLiked});

  @override
  final Joke joke;
  @override
  final bool isLiked;

  @override
  String toString() {
    return 'JokeState.hasJoke(joke: $joke, isLiked: $isLiked)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HasJoke &&
            (identical(other.joke, joke) ||
                const DeepCollectionEquality().equals(other.joke, joke)) &&
            (identical(other.isLiked, isLiked) ||
                const DeepCollectionEquality().equals(other.isLiked, isLiked)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(joke) ^
      const DeepCollectionEquality().hash(isLiked);

  @JsonKey(ignore: true)
  @override
  $HasJokeCopyWith<HasJoke> get copyWith =>
      _$HasJokeCopyWithImpl<HasJoke>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noJoke,
    required TResult Function() loading,
    required TResult Function(Joke joke, bool isLiked) hasJoke,
  }) {
    return hasJoke(joke, isLiked);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noJoke,
    TResult Function()? loading,
    TResult Function(Joke joke, bool isLiked)? hasJoke,
    required TResult orElse(),
  }) {
    if (hasJoke != null) {
      return hasJoke(joke, isLiked);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoJoke value) noJoke,
    required TResult Function(JokeLoading value) loading,
    required TResult Function(HasJoke value) hasJoke,
  }) {
    return hasJoke(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoJoke value)? noJoke,
    TResult Function(JokeLoading value)? loading,
    TResult Function(HasJoke value)? hasJoke,
    required TResult orElse(),
  }) {
    if (hasJoke != null) {
      return hasJoke(this);
    }
    return orElse();
  }
}

abstract class HasJoke implements JokeState {
  const factory HasJoke({required Joke joke, required bool isLiked}) =
      _$HasJoke;

  Joke get joke => throw _privateConstructorUsedError;
  bool get isLiked => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HasJokeCopyWith<HasJoke> get copyWith => throw _privateConstructorUsedError;
}
