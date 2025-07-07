import 'package:moviee/feature/domain/entities/trending_movies_entity.dart';
import 'package:moviee/feature/domain/entities/watchlist_entity.dart';

abstract class SearchMovie {
  Future<WatchlistMoviesEntity> search(String searchValue);
}