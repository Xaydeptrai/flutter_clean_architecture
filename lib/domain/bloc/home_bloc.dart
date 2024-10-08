import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb/domain/bloc/base_bloc.dart';
import 'package:imdb/domain/event/home_event.dart';
import 'package:imdb/domain/repositories/movie_repository.dart';
import 'package:imdb/domain/state/home_state.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc(this._movieRepository) : super(InitialHomeState()) {
    on<FetchTrendingMoviesHomeEvent>(_handleFetchTrendingMovies);
    on<FetchTopRatedMoviesHomeEvent>(_handleFetchTopRatedMovies);
    on<FetchPopularMoviesHomeEvent>(_handlePopularMovies);
  }


  final MovieRepository _movieRepository;

  FutureOr<void> _handleFetchTrendingMovies(
      FetchTrendingMoviesHomeEvent event,
      Emitter<HomeState> emit
  ) async {
    emit(FetchingTrendingMoviesHomeState());
    try {
      final data = await _movieRepository.getTrendingMoviesOfThisWeek();
      emit(FetchedTrendingMoviesHomeState(data));
    } on Object catch(_){
      emit(FetchFailTrendingMoviesHomeState());
    }
  }

  FutureOr<void> _handleFetchTopRatedMovies(
      FetchTopRatedMoviesHomeEvent event,
      Emitter<HomeState> emit) async {
    emit(FetchingTopRatedMoviesHomeState());
    try {
      final data = await _movieRepository.getTopRatedMovies();
      emit(FetchedTopRatedMoviesHomeState(data));
    } on Object catch(_){
      emit(FetchFailTopRatedMoviesHomeState());
    }
  }


  FutureOr<void> _handlePopularMovies(
      FetchPopularMoviesHomeEvent event,
      Emitter<HomeState> emit) async {
    emit(FetchingPopularMoviesHomeState());
    try {
      final data = await _movieRepository.getPopularMovies();
      emit(FetchedPopularMoviesHomeState(data));
    } on Object catch(_){
      emit(FetchFailPopularMoviesHomeState());
    }
  }
}