import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hs_app/domain/joke/joke.dart';
import 'package:hs_app/infrastructure/favorite/favorite_service.dart';

class FavoriteRepo {
  final FavoriteService favoriteService;

  FavoriteRepo(this.favoriteService);

  List<Joke> getAllFavorites() {
    return favoriteService
            .getAllFavorites()
            ?.map((e) => Joke(joke: e))
            .toList() ??
        [];
  }
}

final favoriteRepoProvider = Provider<FavoriteRepo>((ref) {
  final favoriteService = ref.watch(favoriteServiceProvider);
  return FavoriteRepo(favoriteService);
});
