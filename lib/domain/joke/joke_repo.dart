import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hs_app/infrastructure/favorite/favorite_service.dart';
import 'package:hs_app/infrastructure/joke/joke_service.dart';

import 'joke.dart';

class JokeRepo {
  final JokeService jokeService;
  final FavoriteService favoriteService;

  JokeRepo(this.jokeService, this.favoriteService);

  Future<Joke> getRandomDadJoke() async {
    final json = await jokeService.getRandomDadJoke();
    if (json != null) {
      return Joke.fromJson(json);
    } else {
      return Joke(joke: '');
    }
  }

  void addJokeToFavorite(Joke joke) {
    favoriteService.addToFavorites(joke.joke);
  }
}

final jokeRepoProvider = Provider<JokeRepo>((ref) {
  final jokeService = ref.watch(jokeServiceProvider);
  final favortiteService = ref.watch(favoriteServiceProvider);
  return JokeRepo(jokeService, favortiteService);
});
