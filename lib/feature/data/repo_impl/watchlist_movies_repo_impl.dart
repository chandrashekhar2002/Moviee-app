import 'package:moviee/core/api_calls_handler/dio_instantiation.dart';
import 'package:moviee/feature/domain/repos/watchlist_movies.dart';
import 'package:moviee/feature/presentation/riverpod/nowplaying_provider.dart';

class WatchListMoviesRepoImpl implements WatchListMovie {

  @override
  Future<dynamic> setWatchlist(Map<String, dynamic> path) async {
    return await apiClient.postWatchList(path);
  }

}