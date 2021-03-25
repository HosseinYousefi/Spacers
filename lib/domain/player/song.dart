import 'package:freezed_annotation/freezed_annotation.dart';

part 'song.freezed.dart';
part 'song.g.dart';

@freezed
abstract class Song with _$Song {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Song({
    required String name,
    @JsonKey(name: 'artist') required String artistName,
  }) = _Song;

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);
}
