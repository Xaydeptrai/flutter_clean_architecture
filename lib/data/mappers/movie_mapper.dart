import 'package:imdb/app/utils/app_utils.dart';
import 'package:imdb/data/remote/responses/movie_response.dart';
import 'package:imdb/domain/entities/movie_data.dart';

extension MovieMapper on MovieResponse {
  MovieData toData() => MovieData(
      id: id,
      title: title,
      rating: voteAverage,
      posterUrl: AppUtils.addBaseImageUrl(posterPath),
  );
}