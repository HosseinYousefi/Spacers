import 'package:freezed_annotation/freezed_annotation.dart';

part 'song.freezed.dart';

@freezed
abstract class Song with _$Song {
  const factory Song({
    required String name,
    required String artistName,
  }) = _Song;
}
