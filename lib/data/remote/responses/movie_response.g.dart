// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResponse _$MovieResponseFromJson(Map<String, dynamic> json) =>
    MovieResponse(
      (json['id'] as num).toInt(),
      json['title'] as String,
      (json['vote_average'] as num).toDouble(),
      json['poster_path'] as String,
      json['release_date'] as String,
    );

Map<String, dynamic> _$MovieResponseToJson(MovieResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'vote_average': instance.voteAverage,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
    };
