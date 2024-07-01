import 'package:equatable/equatable.dart';
import 'package:imdb/domain/entities/movie_data.dart';

sealed class HomeState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class InitialHomeState extends HomeState {}

sealed class TrendingMoviesHomeState extends HomeState {}

class FetchingTrendingMoviesHomeState extends TrendingMoviesHomeState {}

class FetchFailTrendingMoviesHomeState extends TrendingMoviesHomeState {}

class FetchedTrendingMoviesHomeState extends TrendingMoviesHomeState {
  FetchedTrendingMoviesHomeState(this.movies);

  final List<MovieData> movies;

  @override
  List<Object?> get props => [movies];
}

sealed class TopRatedMoviesHomeState extends HomeState {}

class FetchingTopRatedMoviesHomeState extends TopRatedMoviesHomeState {}

class FetchFailTopRatedMoviesHomeState extends TopRatedMoviesHomeState {}

class FetchedTopRatedMoviesHomeState extends TopRatedMoviesHomeState {
  FetchedTopRatedMoviesHomeState(this.movies);

  final List<MovieData> movies;

  @override
  List<Object?> get props => [movies];
}


sealed class PopularMoviesHomeState extends HomeState {}

class FetchingPopularMoviesHomeState extends PopularMoviesHomeState {}

class FetchFailPopularMoviesHomeState extends PopularMoviesHomeState {}

class FetchedPopularMoviesHomeState extends PopularMoviesHomeState {
  FetchedPopularMoviesHomeState(this.movies);

  final List<MovieData> movies;

  @override
  List<Object?> get props => [movies];
}