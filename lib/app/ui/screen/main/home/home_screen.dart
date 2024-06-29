import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb/app/ui/screen/main/home/home_screen_view_model.dart';
import 'package:imdb/domain/bloc/home_bloc.dart';
import 'package:imdb/domain/entities/movie_data.dart';
import 'package:imdb/domain/state/home_state.dart';
import 'package:imdb/library/resource/typography.dart';
import 'package:imdb_localization/strings.g.dart';

import 'widgets/movie_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    required this.viewModel,
    super.key
  });

  final HomeScreenViewModel viewModel;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      widget.viewModel.fetchTrendingMovies(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                context.t.home.trendingThisWeek,
                style: AppTypography.title,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 312,
              child: BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (_, state) => state is TrendingMoviesHomeState,
                builder: (context, state) {
                  if (state is FetchedTrendingMoviesHomeState) {
                    return ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemCount: state.movies.length,
                      itemBuilder: (_, index) {
                        final movie = state.movies[index];
                        return Row(
                          children: [
                            if(index == 0) const SizedBox(width: 16,),
                            MovieItem(
                                movieData: movie,
                                index: index
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
        ),
      ),
    );
  }
}
