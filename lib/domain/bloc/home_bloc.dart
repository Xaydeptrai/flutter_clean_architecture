import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb/domain/bloc/base_bloc.dart';
import 'package:imdb/domain/event/home_event.dart';
import 'package:imdb/domain/repositories/movie_repository.dart';
import 'package:imdb/domain/state/home_state.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc(this._movieRepository) : super(InitialHomeState()) {
    on<FetchTrendingMoviesHomeEvent>(_handleFetchTrendingMovies);
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
}