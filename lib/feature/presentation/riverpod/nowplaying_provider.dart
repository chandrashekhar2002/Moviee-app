
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviee/core/api_calls_handler/dio_instantiation.dart';
import 'package:moviee/core/di/di.dart';
import 'package:moviee/feature/data/models/trending_movies_model.dart';
import 'package:moviee/feature/data/repo_impl/trending_movies.dart';
import 'package:moviee/feature/domain/entities/trending_movies_entity.dart';
import 'package:moviee/feature/presentation/riverpod/providers.dart';

class NowPlayingNotifer extends Notifier<List<Result>?> {
  @override
  List<Result>? build() {
    return [];
  }

  Future<void> getNowPlaying() async {
    final _response = await apiClient.getNowPlaying();
    print('_client now playing: $_response');
    print('_client now playing: ${_response.runtimeType}');
    final TrendingMovies _m = TrendingMoviesModel.fromJson(_response);
    print('_m.results :${_m.results}');
    state = _m.results;
  }

}
