import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/favorite/favorite_repo.dart';
import '../../domain/joke/joke.dart';

class FavoriteBloc extends StateNotifier<List<Joke>> {
  final FavoriteRepo favoriteRepo;

  FavoriteBloc(this.favoriteRepo) : super([]);

  void getAllFavorites() {
    state = favoriteRepo.getAllFavorites();
  }
}

final favoriteBlocProvider = StateNotifierProvider<FavoriteBloc>((ref) {
  final favoriteRepo = ref.watch(favoriteRepoProvider);
  return FavoriteBloc(favoriteRepo);
});
