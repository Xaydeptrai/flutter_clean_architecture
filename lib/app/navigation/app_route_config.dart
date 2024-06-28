import 'package:go_router/go_router.dart';
import 'package:imdb/app/navigation/app_route.dart';
import 'package:imdb/app/ui/screen/main/main_screen.dart';
import 'package:imdb/app/ui/screen/main/main_screen_view_model.dart';
import 'package:imdb/app/ui/screen/splash/splash_screen.dart';
import 'package:imdb/app/ui/screen/splash/splash_screen_view_model.dart';

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
        builder: (_, __) => MainScreen(
            viewModel: MainScreenViewModel(),
        )
    ),
  ];
}