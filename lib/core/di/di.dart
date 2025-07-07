import 'package:get_it/get_it.dart';
import 'package:moviee/core/api_calls_handler/dio_handler.dart';
import 'package:moviee/core/api_calls_handler/dio_instantiation.dart';
import 'package:moviee/feature/data/repo_impl/get_trending_movies.dart';
import 'package:moviee/feature/domain/repos/get_trending_movies_repo.dart';

final getIt = GetIt.instance;

final dioInstance = GetIt.instance<DioClient>().dio;

void setup() {
  getIt.registerLazySingleton(() => DioClient());
  getIt.registerLazySingleton<APIManager>(() => DioApiHandler());
  getIt.registerLazySingleton<GetTrendingMovies>(() => GetTrendingMoviesRepoImpl());
}
