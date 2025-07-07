
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviee/core/api_calls_handler/dio_instantiation.dart';
import 'package:moviee/core/di/di.dart';
import 'package:moviee/feature/data/models/trending_movies_model.dart';
import 'package:moviee/feature/data/repo_impl/trending_movies.dart';
import 'package:moviee/feature/domain/entities/trending_movies_entity.dart';
import 'package:moviee/feature/domain/usecases/usecases.dart';
import 'package:moviee/feature/presentation/riverpod/providers.dart';

import '../../domain/entities/watchlist_entity.dart';

class SearchMovieProvider extends Notifier<List<WatchListResults>?> {
  @override
  List<WatchListResults>? build() {
    return [];
  }

  Future<void> getSearchResults(String data) async {
    final _response = await SearchMovieUseCase().callApi(data: data);
    state = _response.results;
  }

}
