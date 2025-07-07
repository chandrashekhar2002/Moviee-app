import 'package:moviee/core/api_calls_handler/dio_handler.dart';
import 'package:moviee/core/api_endpoints.dart';
import 'package:moviee/core/di/di.dart';
import 'package:moviee/feature/domain/entities/watchlist_entity.dart';
import 'package:moviee/feature/domain/repos/search_movie_repo.dart';

import '../models/watchlist_model.dart';

class SearchMovieRepoImpl implements SearchMovie {
  final _apiHandler = getIt.get<APIManager>();

  @override
  Future<WatchlistMoviesEntity> search(String data) async {
    final response = await _apiHandler.get(searchMovies,data: {'query' : data});
    return WatchListModel.fromJson(response.data);
  }

}