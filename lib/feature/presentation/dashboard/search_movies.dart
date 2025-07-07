import 'dart:async';

import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviee/core/api_endpoints.dart';
import 'package:moviee/feature/domain/entities/trending_movies_entity.dart';
import 'package:moviee/feature/domain/entities/watchlist_entity.dart';
import 'package:moviee/feature/presentation/dashboard/trending_movies.dart';
import 'package:moviee/feature/presentation/details/search_details.dart';
import 'package:moviee/feature/presentation/riverpod/providers.dart';

Timer? _throttle;

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _list = ref.watch(searchedMovieRes);
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        AnimatedSearchBar(
          label: "      Search Movie Here",
          cursorColor: Colors.white,
          labelStyle: const TextStyle(color: Colors.white),
          labelTextAlign: TextAlign.center,
          closeIcon: const Icon(Icons.close, color: Colors.white),
          searchIcon: const Icon(Icons.search, color: Colors.white),
          searchStyle: const TextStyle(color: Colors.white),
          searchDecoration: const InputDecoration(
            hintStyle: TextStyle(color: Colors.white70),
            filled: true,
            fillColor: Colors.transparent, // or Colors.black12 for slight visibility
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: Colors.white),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          onChanged: (value) async {
            if (_throttle?.isActive ?? false) _throttle!.cancel();
            _throttle = Timer(const Duration(milliseconds: 1500), () async {
              await ref.read(searchedMovieRes.notifier).getSearchResults(value);
            });
          },
        ),

        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7, // Width / Height
            ),
            itemCount: _list?.length, // Replace with your list
            itemBuilder: (BuildContext context, int index) {
              final _img = imageBaseUrl + (_list?[index].backdropPath ?? '');
              return GestureDetector(
                onTap: () {
                  _openBottomSheet(context, _list![index]);
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
                      _list?[index].title ?? 'NA',
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
          ),
        )

      ],
    );
  }

  Future<void> waitFunc() async {
    await Future.delayed(Duration(seconds: 4));
  }
}


_openBottomSheet(BuildContext context, WatchListResults movie) {
  showModalBottomSheet(
    context: context,
    enableDrag: true,
    isScrollControlled: true,

    builder: (context) {
      return CheckMovieDetails(movie);
    },
  );
}