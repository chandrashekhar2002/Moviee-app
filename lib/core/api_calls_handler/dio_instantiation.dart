import 'package:dio/dio.dart';
import 'package:moviee/core/di/di.dart';
import 'package:moviee/feature/data/repo_impl/trending_movies.dart';


final MoviesApiClient apiClient = MoviesApiClient(dioInstance);

class DioClient {
  static final DioClient _instance = DioClient._internal();

  factory DioClient() => _instance;

  DioClient._internal();

  final Dio dio = Dio(BaseOptions(
      connectTimeout: 10000,
      receiveTimeout: 10000,
      responseType: ResponseType.json,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYWM0ZDdiNmUwYzcyMDE1OGUzZDE4MzBjMTc3OTc0MCIsIm5iZiI6MTc1MTM3NDY4NC4zMjMsInN1YiI6IjY4NjNkYjVjY2Q0ZDg2MTYyYThjMjQ2OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.d9gd7jJazuHrkBp8ngG15E_tmPf2JiFEtQvJr2WtnZU'
      }));
}
