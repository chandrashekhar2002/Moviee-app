// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_movies_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrendingMoviesModelAdapter extends TypeAdapter<TrendingMoviesModel> {
  @override
  final int typeId = 1;

  @override
  TrendingMoviesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TrendingMoviesModel(
      page: fields[1] as int?,
      results: (fields[3] as List?)?.cast<ResultModel>(),
      totalPages: fields[5] as int?,
      totalResults: fields[7] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, TrendingMoviesModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.page)
      ..writeByte(3)
      ..write(obj.results)
      ..writeByte(5)
      ..write(obj.totalPages)
      ..writeByte(7)
      ..write(obj.totalResults);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrendingMoviesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ResultModelAdapter extends TypeAdapter<ResultModel> {
  @override
  final int typeId = 2;

  @override
  ResultModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ResultModel(
      adult: fields[1] as bool?,
      backdropPath: fields[3] as String?,
      id: fields[5] as int?,
      title: fields[7] as String?,
      originalTitle: fields[9] as String?,
      overview: fields[11] as String?,
      posterPath: fields[13] as String?,
      mediaType: fields[15] as String?,
      originalLanguage: fields[17] as String?,
      genreIds: (fields[19] as List?)?.cast<int>(),
      popularity: fields[21] as double?,
      releaseDate: fields[23] as DateTime?,
      video: fields[25] as bool?,
      voteAverage: fields[27] as double?,
      voteCount: fields[29] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ResultModel obj) {
    writer
      ..writeByte(15)
      ..writeByte(1)
      ..write(obj.adult)
      ..writeByte(3)
      ..write(obj.backdropPath)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(7)
      ..write(obj.title)
      ..writeByte(9)
      ..write(obj.originalTitle)
      ..writeByte(11)
      ..write(obj.overview)
      ..writeByte(13)
      ..write(obj.posterPath)
      ..writeByte(15)
      ..write(obj.mediaType)
      ..writeByte(17)
      ..write(obj.originalLanguage)
      ..writeByte(19)
      ..write(obj.genreIds)
      ..writeByte(21)
      ..write(obj.popularity)
      ..writeByte(23)
      ..write(obj.releaseDate)
      ..writeByte(25)
      ..write(obj.video)
      ..writeByte(27)
      ..write(obj.voteAverage)
      ..writeByte(29)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendingMoviesModel _$TrendingMoviesModelFromJson(Map<String, dynamic> json) =>
    TrendingMoviesModel(
      page: (json['page'] as num?)?.toInt(),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => ResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      totalResults: (json['total_results'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TrendingMoviesModelToJson(
        TrendingMoviesModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };

ResultModel _$ResultModelFromJson(Map<String, dynamic> json) => ResultModel(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      mediaType: json['media_type'] as String?,
      originalLanguage: json['original_language'] as String?,
      genreIds: (json['genre_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      popularity: (json['popularity'] as num?)?.toDouble(),
      releaseDate: json['release_date'] == null
          ? null
          : DateTime.parse(json['release_date'] as String),
      video: json['video'] as bool?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: (json['vote_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ResultModelToJson(ResultModel instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'id': instance.id,
      'title': instance.title,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'media_type': instance.mediaType,
      'original_language': instance.originalLanguage,
      'genre_ids': instance.genreIds,
      'popularity': instance.popularity,
      'release_date': instance.releaseDate?.toIso8601String(),
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
