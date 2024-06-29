import 'package:imdb/domain/entities/movie_data.dart';

abstract class MovieRepository {
  Future<List<MovieData>> getTrendingMoviesOfThisWeek();

}