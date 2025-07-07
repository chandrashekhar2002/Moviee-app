import 'package:moviee/core/api_calls_handler/dio_handler.dart';
import 'package:moviee/core/di/di.dart';
import 'package:moviee/feature/data/models/trending_movies_model.dart';
import 'package:moviee/feature/domain/entities/trending_movies_entity.dart';
import 'package:moviee/feature/domain/repos/get_trending_movies_repo.dart';

class GetTrendingMoviesRepoImpl implements GetTrendingMovies {
  final _apiHandler = getIt.get<APIManager>();

  @override
  Future<TrendingMovies> getMovies(String path) async {
    final response = await _apiHandler.get(path);
    return TrendingMoviesModel.fromJson(response.data);
  }
}
