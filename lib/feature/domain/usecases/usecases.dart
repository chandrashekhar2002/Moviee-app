import 'package:moviee/core/di/di.dart';
import 'package:moviee/feature/data/repo_impl/get_watchlist_movies.dart';
import 'package:moviee/feature/data/repo_impl/search_movie_repo_impl.dart';
import 'package:moviee/feature/data/repo_impl/watchlist_movies_repo_impl.dart';
import 'package:moviee/feature/domain/entities/trending_movies_entity.dart';
import 'package:moviee/feature/domain/entities/watchlist_entity.dart';
import 'package:moviee/feature/domain/repos/get_trending_movies_repo.dart';
import 'package:moviee/feature/domain/repos/search_movie_repo.dart';
import 'package:moviee/feature/domain/repos/watchlist_movies.dart';

abstract class UseCase<T> {
  Future<T> callApi({dynamic data});
}

class TrendingMoviesUseCase implements UseCase<TrendingMovies> {
  @override
  Future<TrendingMovies> callApi({dynamic data}) async {
    return await getIt.get<GetTrendingMovies>().getMovies(data);
  }
}

class WatchListMoviesUseCase implements UseCase<dynamic> {
  final WatchListMovie _wl = WatchListMoviesRepoImpl();

  @override
  Future<dynamic> callApi({dynamic data}) async {
    return await _wl.setWatchlist(data);
  }
}

class GetWatchListMoviesUseCase implements UseCase<dynamic> {
  final GetWatchListMovies _wl = GetWatchListMoviesRepoImpl();

  @override
  Future<dynamic> callApi({dynamic data}) async {
    return await _wl.getWatchListMovies();
  }
}

class SearchMovieUseCase implements UseCase<dynamic> {
  final SearchMovie _wl = SearchMovieRepoImpl();

  @override
  Future<WatchlistMoviesEntity> callApi({dynamic data}) async {
    return await _wl.search(data);
  }
}
