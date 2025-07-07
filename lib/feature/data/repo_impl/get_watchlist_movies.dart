import 'package:moviee/core/api_calls_handler/dio_instantiation.dart';
import 'package:moviee/feature/domain/repos/watchlist_movies.dart';

class GetWatchListMoviesRepoImpl implements GetWatchListMovies {
  @override
  Future<void> getWatchListMovies() async {
    return await apiClient.getBookMarks();
  }

}