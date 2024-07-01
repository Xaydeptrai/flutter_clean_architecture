import 'package:json_annotation/json_annotation.dart';

part 'movie_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieResponse {
  final int id;
  final String title;
  final double voteAverage;
  final String posterPath;
  final String releaseDate;

  const MovieResponse(
    this.id,
    this.title,
    this.voteAverage,
    this.posterPath,
    this.releaseDate,
  );

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);
}
