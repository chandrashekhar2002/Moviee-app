class TrendingMovies {
  final int? page;
  final List<Result>? results;
  final int? totalPages;
  final int? totalResults;

  TrendingMovies({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

}

class Result {
  final bool? adult;
  final String? backdropPath;
  final int? id;
  final String? title;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final String? mediaType;
  final String? originalLanguage;
  final List<int>? genreIds;
  final double? popularity;
  final DateTime? releaseDate;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  Result({
    this.adult,
    this.backdropPath,
    this.id,
    this.title,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.originalLanguage,
    this.genreIds,
    this.popularity,
    this.releaseDate,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

}
