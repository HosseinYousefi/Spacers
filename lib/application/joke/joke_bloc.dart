import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/joke/joke.dart';
import '../../domain/joke/joke_repo.dart';
import 'joke_state.dart';

class JokeBloc extends StateNotifier<JokeState> {
  final JokeRepo jokeRepo;

  JokeBloc(this.jokeRepo) : super(JokeState.noJoke());

  Future<void> randomJokePressed() async {
    state = JokeState.loading();
    final joke = await jokeRepo.getRandomDadJoke();
    if (joke.joke == '') {
      state = JokeState.noJoke();
    } else {
      state = JokeState.hasJoke(joke: joke, isLiked: false);
    }
  }

  void likedPressed(Joke joke) {
    jokeRepo.addJokeToFavorite(joke);
    if (state is HasJoke) {
      state = (state as HasJoke).copyWith(isLiked: true);
    }
  }
}

final jokeBlocProvider = StateNotifierProvider<JokeBloc>((ref) {
  final jokeRepo = ref.watch(jokeRepoProvider);
  return JokeBloc(jokeRepo);
});
