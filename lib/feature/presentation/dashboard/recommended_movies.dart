import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviee/core/api_endpoints.dart';
import 'package:moviee/feature/presentation/dashboard/trending_movies.dart';
import 'package:moviee/feature/presentation/details/movie_details.dart';
import 'package:moviee/feature/presentation/riverpod/providers.dart';
import 'package:moviee/feature/presentation/user_onboarding/sliding_text.dart';

final ScrollController _scrollController = ScrollController();

class RecommendedMoviesScreen extends ConsumerWidget {
  const RecommendedMoviesScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(nowPlayingProvider);
    print('movies now playing:${movies}');
    if (movies == null || movies.isEmpty) {
      return const Center(child: Text('No Movies found', style: TextStyle(color: Colors.white),));
    }

    return SingleChildScrollView(
      controller: _scrollController,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const ShiningTitle(text: 'Most Recommended'),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                controller: _scrollController,
                scrollDirection: Axis.vertical,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      openBottomSheet(context, movies[index]);
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        children: [
                          CachedNetworkImage(
                              imageUrl:
                                  imageBaseUrl + movies[index].backdropPath!,
                            placeholder: (context, url) => CircularProgressIndicator(),
                            errorWidget: (context, url, error) => Icon(Icons.error),),
                          Container(
                            height: 40,
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            color: Colors.blueGrey.withOpacity(0.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(
                                  child: Text(
                                    movies[index].title ?? '',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                                Icon(Icons.local_fire_department_rounded,
                                    color: Colors.orange.shade700),
                                Text('${movies[index].popularity}',
                                    style: TextStyle(color: Colors.white)),
                                const SizedBox(width: 10),
                                Container(
                                  height: 20,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [Colors.blue, Colors.purple],
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                    ),
                                    onPressed: () async {
                                      final Map<String, dynamic> _map = {
                                        "media_type": "movie",
                                        "media_id": movies[index].id,
                                        "watchlist": true
                                      };
                                      await ref
                                          .read(setWatchListMovie.notifier)
                                          .setWatchList(_map);
                                    },
                                    child: const Text('Bookmark'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ]),
      ),
    );
  }
}
