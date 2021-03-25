// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'song.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Song _$SongFromJson(Map<String, dynamic> json) {
  return _Song.fromJson(json);
}

/// @nodoc
class _$SongTearOff {
  const _$SongTearOff();

  _Song call(
      {required String name,
      @JsonKey(name: 'artist') required String artistName}) {
    return _Song(
      name: name,
      artistName: artistName,
    );
  }

  Song fromJson(Map<String, Object> json) {
    return Song.fromJson(json);
  }
}

/// @nodoc
const $Song = _$SongTearOff();

/// @nodoc
mixin _$Song {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'artist')
  String get artistName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SongCopyWith<Song> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongCopyWith<$Res> {
  factory $SongCopyWith(Song value, $Res Function(Song) then) =
      _$SongCopyWithImpl<$Res>;
  $Res call({String name, @JsonKey(name: 'artist') String artistName});
}

/// @nodoc
class _$SongCopyWithImpl<$Res> implements $SongCopyWith<$Res> {
  _$SongCopyWithImpl(this._value, this._then);

  final Song _value;
  // ignore: unused_field
  final $Res Function(Song) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? artistName = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      artistName: artistName == freezed
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SongCopyWith<$Res> implements $SongCopyWith<$Res> {
  factory _$SongCopyWith(_Song value, $Res Function(_Song) then) =
      __$SongCopyWithImpl<$Res>;
  @override
  $Res call({String name, @JsonKey(name: 'artist') String artistName});
}

/// @nodoc
class __$SongCopyWithImpl<$Res> extends _$SongCopyWithImpl<$Res>
    implements _$SongCopyWith<$Res> {
  __$SongCopyWithImpl(_Song _value, $Res Function(_Song) _then)
      : super(_value, (v) => _then(v as _Song));

  @override
  _Song get _value => super._value as _Song;

  @override
  $Res call({
    Object? name = freezed,
    Object? artistName = freezed,
  }) {
    return _then(_Song(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      artistName: artistName == freezed
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)

/// @nodoc
class _$_Song implements _Song {
  const _$_Song(
      {required this.name, @JsonKey(name: 'artist') required this.artistName});

  factory _$_Song.fromJson(Map<String, dynamic> json) =>
      _$_$_SongFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'artist')
  final String artistName;

  @override
  String toString() {
    return 'Song(name: $name, artistName: $artistName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Song &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.artistName, artistName) ||
                const DeepCollectionEquality()
                    .equals(other.artistName, artistName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(artistName);

  @JsonKey(ignore: true)
  @override
  _$SongCopyWith<_Song> get copyWith =>
      __$SongCopyWithImpl<_Song>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SongToJson(this);
  }
}

abstract class _Song implements Song {
  const factory _Song(
      {required String name,
      @JsonKey(name: 'artist') required String artistName}) = _$_Song;

  factory _Song.fromJson(Map<String, dynamic> json) = _$_Song.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'artist')
  String get artistName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SongCopyWith<_Song> get copyWith => throw _privateConstructorUsedError;
}
