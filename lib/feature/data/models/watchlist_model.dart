import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moviee/feature/domain/entities/trending_movies_entity.dart';
import 'package:moviee/feature/domain/entities/watchlist_entity.dart';

part 'watchlist_model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class WatchListModel implements WatchlistMoviesEntity {
  @HiveField(1)
  @JsonKey(name: "page")
  final int? page;
  @HiveField(3)
  @JsonKey(name: "results")
  final List<WatchListResultsModel>? results;
  @HiveField(5)
  @JsonKey(name: "total_pages")
  final int? totalPages;
  @HiveField(7)
  @JsonKey(name: "total_results")
  final int? totalResults;

  WatchListModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory WatchListModel.fromJson(Map<String, dynamic> json) =>
      _$WatchListModelFromJson(json);

  Map<String, dynamic> toJson() => _$WatchListModelToJson(this);
}

@HiveType(typeId: 2)
@JsonSerializable()
class WatchListResultsModel implements WatchListResults {
  @HiveField(1)
  @JsonKey(name: "adult")
  final bool? adult;
  @HiveField(3)
  @JsonKey(name: "backdrop_path")
  final String? backdropPath;
  @HiveField(5)
  @JsonKey(name: "id")
  final int? id;
  @HiveField(7)
  @JsonKey(name: "title")
  final String? title;
  @HiveField(9)
  @JsonKey(name: "original_title")
  final String? originalTitle;
  @HiveField(11)
  @JsonKey(name: "overview")
  final String? overview;
  @HiveField(13)
  @JsonKey(name: "poster_path")
  final String? posterPath;
  @HiveField(15)
  @JsonKey(name: "media_type")
  final String? mediaType;
  @HiveField(17)
  @JsonKey(name: "original_language")
  final String? originalLanguage;
  @HiveField(19)
  @JsonKey(name: "genre_ids")
  final List<int>? genreIds;
  @HiveField(21)
  @JsonKey(name: "popularity")
  final double? popularity;
  @HiveField(23)
  @JsonKey(name: "release_date")
  final String? releaseDate;
  @HiveField(25)
  @JsonKey(name: "video")
  final bool? video;
  @HiveField(27)
  @JsonKey(name: "vote_average")
  final double? voteAverage;
  @HiveField(29)
  @JsonKey(name: "vote_count")
  final int? voteCount;

  WatchListResultsModel({
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

  factory WatchListResultsModel.fromJson(Map<String, dynamic> json) =>
      _$WatchListResultsModelFromJson(json);

  Map<String, dynamic> toJson() => _$WatchListResultsModelToJson(this);
}
