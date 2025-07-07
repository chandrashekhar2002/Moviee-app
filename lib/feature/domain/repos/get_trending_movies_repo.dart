import 'package:moviee/feature/domain/entities/trending_movies_entity.dart';

abstract class GetTrendingMovies {
  Future<TrendingMovies> getMovies(String path);
}