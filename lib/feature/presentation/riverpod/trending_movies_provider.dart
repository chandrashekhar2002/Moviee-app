import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviee/core/api_calls_handler/dio_instantiation.dart';
import 'package:moviee/feature/data/models/trending_movies_model.dart';
import 'package:moviee/feature/domain/entities/trending_movies_entity.dart';
import 'package:moviee/feature/presentation/riverpod/providers.dart';

class TrendingMoviesNotifier extends Notifier<List<Result>?> {
  @override
  List<Result>? build() {
    return [];
  }

  Future<bool> getMovies() async {
    ref.read(calledMoviesApi.notifier).state = false;
    try {
      final _response = await apiClient.getTrendingMovies();
      final TrendingMovies _m = TrendingMoviesModel.fromJson(_response);
      state = _m.results;
    } catch (e) {
      state = [];
    }
    ref.read(calledMoviesApi.notifier).state = true;
    return true;
  }
}
