import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/player/song.dart';
import 'player_state.dart';

class PlayerBloc extends StateNotifier<PlayerState> {
  PlayerBloc()
      : super(PlayerState(
          recentlyPlayed: [
            Song(
              name: 'Never Gonna Give You Up',
              artistName: 'Rick Astley',
            ),
            Song(
              name: 'Nyan Cat',
              artistName: 'Nyan Cat',
            ),
            Song(
              name: 'Upside Down',
              artistName: 'Diana Ross',
            ),
          ],
        ));

  void play(Song s) {
    final recentlyPlayed = state.recentlyPlayed;
    if (recentlyPlayed.contains(s)) {
      recentlyPlayed.remove(s);
    }
    recentlyPlayed.insert(0, s);
    if (recentlyPlayed.length > 10) {
      recentlyPlayed.removeLast();
    }
    state = state.copyWith(recentlyPlayed: recentlyPlayed);
  }
}

final playerBlocProvider = StateNotifierProvider((_) => PlayerBloc());
