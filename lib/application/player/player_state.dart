import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/player/song.dart';

part 'player_state.freezed.dart';

@freezed
abstract class PlayerState with _$PlayerState {
  const factory PlayerState({
    required List<Song> recentlyPlayed,
  }) = _PlayerState;
}
