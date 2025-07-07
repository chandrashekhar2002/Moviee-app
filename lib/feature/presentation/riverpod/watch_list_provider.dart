import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviee/core/api_calls_handler/dio_instantiation.dart';
import 'package:moviee/core/di/di.dart';
import 'package:moviee/feature/data/models/trending_movies_model.dart';
import 'package:moviee/feature/data/repo_impl/trending_movies.dart';
import 'package:moviee/feature/domain/entities/trending_movies_entity.dart';
import 'package:moviee/feature/presentation/riverpod/providers.dart';

class WatchListProvider extends Notifier<void> {
  Future<void> setWatchList(Map<String, dynamic> body) async {
    final response = await apiClient.postWatchList(body);
    print('_client watch list done : $response');
  }

  @override
  void build() {}
}
