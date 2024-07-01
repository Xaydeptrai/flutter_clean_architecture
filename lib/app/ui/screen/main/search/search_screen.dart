
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb/app/ui/screen/main/home/widgets/movie_item.dart';
import 'package:imdb/app/ui/screen/main/search/search_screen_view_model.dart';
import 'package:imdb/app/ui/screen/main/search/widgets/search_item.dart';
import 'package:imdb/domain/bloc/home_bloc.dart';
import 'package:imdb/domain/entities/movie_data.dart';
import 'package:imdb/domain/state/home_state.dart';
import 'package:imdb/library/resource/typography.dart';
import 'package:imdb_localization/strings.g.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.viewModel});

  final SearchScreenViewModel viewModel;

  @override
  State<SearchScreen> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  final _searchResults = List<MovieData>;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      widget.viewModel.fetchTrendingMovies(context);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32,),
                _SearchBarWidget(),
                SizedBox(height: 16,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _SearchedMoviesWidget(),
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}

class _SearchBarWidget extends StatelessWidget {
  const _SearchBarWidget();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 32, right: 32),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search IMDb",
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}

class _SearchedMoviesWidget extends StatelessWidget {
  const _SearchedMoviesWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 700,
          child: BlocBuilder<HomeBloc, HomeState>(
            buildWhen: (_, state) => state is TrendingMoviesHomeState,
            builder: (context, state) {
              if (state is FetchedTrendingMoviesHomeState) {
                return ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemCount: state.movies.length,
                  itemBuilder: (_, index) {
                    final movie = state.movies[index];
                    return Column(
                      children: [
                        if(index == 0) const SizedBox(width: 16,),
                        SearchItem(
                            movieData: movie,
                            index: index + 1
                        ),
                        if(index == state.movies.length - 1) const SizedBox(width: 16,),
                      ],
                    );
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ],
    );
  }
}




