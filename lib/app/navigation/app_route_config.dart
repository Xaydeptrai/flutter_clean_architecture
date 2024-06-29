import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:imdb/app/navigation/app_route.dart';
import 'package:imdb/app/ui/screen/main/main_screen.dart';
import 'package:imdb/app/ui/screen/main/main_screen_view_model.dart';
import 'package:imdb/app/ui/screen/splash/splash_screen.dart';
import 'package:imdb/app/ui/screen/splash/splash_screen_view_model.dart';
import 'package:imdb/core/di/inject.dart';
import 'package:imdb/domain/bloc/home_bloc.dart';

class AppRouteConfig {
  late final GoRouter router = GoRouter(
    routes: _routes,
    initialLocation: AppRoute.root,
  );

  void dispose() {

  }

  late final _routes = <RouteBase>[
    GoRoute(
        path: '/',
        name: AppRoute.root,
        builder: (context, state) => SplashScreen(
            viewModel: SplashScreenViewModel()
        ),
    ),
    GoRoute(
        path: '/main',
        name: AppRoute.main,
        builder: (_, __) => BlocProvider(
          create: (_) => HomeBloc(inject()),
          child: MainScreen(
              viewModel: MainScreenViewModel(),
          ),
        )
    ),
  ];
}