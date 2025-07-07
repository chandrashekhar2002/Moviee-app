import 'package:flutter/material.dart';
import 'package:moviee/feature/domain/entities/trending_movies_entity.dart';
import 'package:moviee/feature/presentation/dashboard/bookmarked_movies.dart';
import 'package:moviee/feature/presentation/dashboard/recommended_movies.dart';
import 'package:moviee/feature/presentation/dashboard/search_movies.dart';
import 'package:moviee/feature/presentation/dashboard/trending_movies.dart';
import 'package:moviee/feature/presentation/riverpod/get_watchlist_provider.dart';
import 'package:moviee/feature/presentation/riverpod/nowplaying_provider.dart';
import 'package:moviee/feature/presentation/riverpod/search_movie_provider.dart';
import 'package:moviee/feature/presentation/riverpod/watch_list_provider.dart';
import 'package:riverpod/riverpod.dart';

import '../../domain/entities/watchlist_entity.dart';
import 'trending_movies_provider.dart';

final StateProvider<List<Result>?> trendingMoviesList =
    StateProvider<List<Result>?>((ref) => []);

/// const to improve ui effectively
final StateProvider<List<Widget>> navigationList =
    StateProvider<List<Widget>>((ref) => [
          const TrendingMoviesScreen(),
          const RecommendedMoviesScreen(),
          const WatchListScreen(),
          const SearchScreen(),
        ]);

final StateProvider<bool?> calledMoviesApi =
    StateProvider<bool?>((ref) => null);

final StateProvider<int> selectedNavIndex = StateProvider<int>((ref) => 0);

final trendingMoviesProvider =
    NotifierProvider<TrendingMoviesNotifier, List<Result>?>(() {
  return TrendingMoviesNotifier();
});

final nowPlayingProvider =
    NotifierProvider<NowPlayingNotifer, List<Result>?>(() {
  return NowPlayingNotifer();
});

final setWatchListMovie = NotifierProvider<WatchListProvider, void>(() {
  return WatchListProvider();
});

final getWatchListMoviesProvider =
    NotifierProvider<GetWatchListMovies, List<Result>?>(() {
  return GetWatchListMovies();
});

final searchedMovieRes =
    NotifierProvider<SearchMovieProvider, List<WatchListResults>?>(() {
  return SearchMovieProvider();
});
