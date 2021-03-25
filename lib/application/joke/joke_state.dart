import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hs_app/domain/joke/joke.dart';

part 'joke_state.freezed.dart';

@freezed
abstract class JokeState with _$JokeState {
  const factory JokeState.noJoke() = NoJoke;
  const factory JokeState.loading() = JokeLoading;
  const factory JokeState.hasJoke({
    required Joke joke,
    required bool isLiked,
  }) = HasJoke;
}
