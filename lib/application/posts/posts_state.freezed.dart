// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'posts_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PostsStateTearOff {
  const _$PostsStateTearOff();

  _PostsState call(
      {required List<Post> posts, required String newPostContent}) {
    return _PostsState(
      posts: posts,
      newPostContent: newPostContent,
    );
  }
}

/// @nodoc
const $PostsState = _$PostsStateTearOff();

/// @nodoc
mixin _$PostsState {
  List<Post> get posts => throw _privateConstructorUsedError;
  String get newPostContent => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostsStateCopyWith<PostsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostsStateCopyWith<$Res> {
  factory $PostsStateCopyWith(
          PostsState value, $Res Function(PostsState) then) =
      _$PostsStateCopyWithImpl<$Res>;
  $Res call({List<Post> posts, String newPostContent});
}

/// @nodoc
class _$PostsStateCopyWithImpl<$Res> implements $PostsStateCopyWith<$Res> {
  _$PostsStateCopyWithImpl(this._value, this._then);

  final PostsState _value;
  // ignore: unused_field
  final $Res Function(PostsState) _then;

  @override
  $Res call({
    Object? posts = freezed,
    Object? newPostContent = freezed,
  }) {
    return _then(_value.copyWith(
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      newPostContent: newPostContent == freezed
          ? _value.newPostContent
          : newPostContent // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$PostsStateCopyWith<$Res> implements $PostsStateCopyWith<$Res> {
  factory _$PostsStateCopyWith(
          _PostsState value, $Res Function(_PostsState) then) =
      __$PostsStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Post> posts, String newPostContent});
}

/// @nodoc
class __$PostsStateCopyWithImpl<$Res> extends _$PostsStateCopyWithImpl<$Res>
    implements _$PostsStateCopyWith<$Res> {
  __$PostsStateCopyWithImpl(
      _PostsState _value, $Res Function(_PostsState) _then)
      : super(_value, (v) => _then(v as _PostsState));

  @override
  _PostsState get _value => super._value as _PostsState;

  @override
  $Res call({
    Object? posts = freezed,
    Object? newPostContent = freezed,
  }) {
    return _then(_PostsState(
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      newPostContent: newPostContent == freezed
          ? _value.newPostContent
          : newPostContent // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
class _$_PostsState implements _PostsState {
  const _$_PostsState({required this.posts, required this.newPostContent});

  @override
  final List<Post> posts;
  @override
  final String newPostContent;

  @override
  String toString() {
    return 'PostsState(posts: $posts, newPostContent: $newPostContent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PostsState &&
            (identical(other.posts, posts) ||
                const DeepCollectionEquality().equals(other.posts, posts)) &&
            (identical(other.newPostContent, newPostContent) ||
                const DeepCollectionEquality()
                    .equals(other.newPostContent, newPostContent)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(posts) ^
      const DeepCollectionEquality().hash(newPostContent);

  @JsonKey(ignore: true)
  @override
  _$PostsStateCopyWith<_PostsState> get copyWith =>
      __$PostsStateCopyWithImpl<_PostsState>(this, _$identity);
}

abstract class _PostsState implements PostsState {
  const factory _PostsState(
      {required List<Post> posts,
      required String newPostContent}) = _$_PostsState;

  @override
  List<Post> get posts => throw _privateConstructorUsedError;
  @override
  String get newPostContent => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PostsStateCopyWith<_PostsState> get copyWith =>
      throw _privateConstructorUsedError;
}
