import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:moviee/core/api_endpoints.dart';
import 'package:moviee/feature/domain/entities/trending_movies_entity.dart';
import 'package:moviee/feature/presentation/details/movie_details.dart';
import 'package:moviee/feature/presentation/riverpod/providers.dart';
import 'package:moviee/feature/presentation/user_onboarding/sliding_text.dart';

class TrendingMoviesScreen extends ConsumerWidget {
  const TrendingMoviesScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(trendingMoviesProvider);
    final _nowPlayin = ref.watch(nowPlayingProvider);
    print('movies :${movies}');
    print('_nowPlayin :${movies}');
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: ShiningTitle(text: 'Trending Movies'),
          ),
          SizedBox(height: 40),
          CarouselSlider.builder(
            itemCount: movies?.length,
            carouselController: CarouselSliderControllerImpl(),
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return GestureDetector(
                onTap: () {
                  openBottomSheet(context, movies![index]);
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: double.infinity - 30,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            imageBaseUrl + movies![index].backdropPath!),
                        fit: BoxFit.cover),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(movies[index].title!,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20)),
                    ),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.8,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: ShiningTitle(text: 'Now Playing'),
          ),
          GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemCount: _nowPlayin?.length,
            itemBuilder: (BuildContext context, int index) {
              final _img = imageBaseUrl + (_nowPlayin?[index].backdropPath ?? '');
              return GestureDetector(
                onTap: () {
                  openBottomSheet(context, _nowPlayin![index]);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(_img), // Replace with your field
                      fit: BoxFit.cover,
                    ),
                  ),
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _nowPlayin?[index].title ?? 'NA',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
            shrinkWrap: true, // If inside another scrollable
            physics: BouncingScrollPhysics(), // Optional
          )

        ],
      ),
    );
  }
}

openBottomSheet(BuildContext context, Result movie) {
  showModalBottomSheet(
    context: context,
    enableDrag: true,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return MovieDetails(movie);
    },
  );
}
