import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavoriteService {
  FavoriteService() {
    Hive.openBox('favorites');
  }

  List<dynamic>? getAllFavorites() {
    return Hive.box('favorites').get('favorites') as List<dynamic>?;
  }

  void addToFavorites(String joke) {
    final favorites = getAllFavorites() ?? [];
    Hive.box('favorites').put('favorites', [joke, ...favorites]);
  }
}

final favoriteServiceProvider = Provider((_) => FavoriteService());
