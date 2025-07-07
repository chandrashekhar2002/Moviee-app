import 'package:dio/dio.dart';
import 'package:moviee/core/api_endpoints.dart';
import 'package:retrofit/http.dart';

part 'trending_movies.g.dart';

@RestApi(baseUrl: moviesBaseUrl)
abstract class MoviesApiClient {
  factory MoviesApiClient(Dio dio, {String baseUrl}) = _MoviesApiClient;

  @GET(trendingMovies)
  Future<dynamic> getTrendingMovies();

  @GET(nowPlaying)
  Future<dynamic> getNowPlaying();

  @POST(addToWatchList)
  Future<dynamic> postWatchList(@Body() Map<String, dynamic> body);

  @GET(getWatchListMovies)
  Future<dynamic> getBookMarks();

  @GET(searchMovies)
  Future<dynamic> searchMovie(@Query('query') String value);

}
