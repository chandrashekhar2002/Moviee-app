import 'package:dio/dio.dart';
import 'package:moviee/core/api_endpoints.dart';

abstract class APIManager<T> {
  Future<T> get(String path, {Map<String, dynamic>? data});
  Future<T> put(String path);
  Future<T> post(String path);
  Future<T> delete(String path);
}

class DioApiHandler implements APIManager {
  final BaseOptions _baseOptions = BaseOptions();
  late Dio _dio;
  DioApiHandler() {
    _baseOptions.baseUrl = moviesBaseUrl;
    _baseOptions.headers['Authorization'] = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYWM0ZDdiNmUwYzcyMDE1OGUzZDE4MzBjMTc3OTc0MCIsIm5iZiI6MTc1MTM3NDY4NC4zMjMsInN1YiI6IjY4NjNkYjVjY2Q0ZDg2MTYyYThjMjQ2OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.d9gd7jJazuHrkBp8ngG15E_tmPf2JiFEtQvJr2WtnZU';
    _dio = Dio(_baseOptions);
  }

  @override
  Future delete(String path) async {
    return await _dio.delete(path);
  }

  @override
  Future get(String path, {Map<String, dynamic>? data}) async {
    return await _dio.get(path, queryParameters: data);
  }

  @override
  Future post(String path) async {
    return await _dio.post(path);
  }

  @override
  Future put(String path) async {
    return await _dio.put(path);
  }

}