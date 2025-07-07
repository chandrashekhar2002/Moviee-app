abstract class WatchListMovie {
  Future<dynamic> setWatchlist(Map<String, dynamic> path);
}


abstract class GetWatchListMovies {
  Future<dynamic> getWatchListMovies();
}