import 'package:flutter/material.dart';
import 'package:moviee/core/api_endpoints.dart';
import 'package:moviee/feature/domain/entities/trending_movies_entity.dart';
import 'package:moviee/feature/domain/entities/watchlist_entity.dart';
import 'package:moviee/feature/presentation/details/movie_details.dart';

import '../../../core/colors.dart';


class CheckMovieDetails extends StatelessWidget {
  const CheckMovieDetails(this.movie, {super.key});

  final WatchListResults movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: appBackGroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Close button
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close_rounded, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              /// Poster
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageBaseUrl + movie.backdropPath!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              const SizedBox(height: 20),

              /// Title
              const DetailHeading('Title'),
              DetailText(movie.title ?? 'N/A'),

              /// Language
              const DetailHeading('Original Language'),
              DetailText(movie.originalLanguage?.toUpperCase() ?? 'N/A'),

              /// Release Date
              const DetailHeading('Release Date'),
              DetailText(movie.releaseDate.toString() ?? 'N/A'),

              /// Media Type
              const DetailHeading('Media Type'),
              DetailText(movie.mediaType ?? 'N/A'),

              /// Overview
              const DetailHeading('Overview'),
              DetailText(movie.overview ?? 'No description available.'),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
TextStyle get commonTextStyle {
  return TextStyle(
    fontSize: 20,
    color: Colors.black,
  );
}

TextStyle get commonTextStyleSideHeading {
  return TextStyle(
      fontSize: 18, color: Colors.black87, overflow: TextOverflow.ellipsis);
}
