import 'package:flutter/material.dart';
import 'package:imdb/app/ui/screen/main/home/home_screen.dart';
import 'package:imdb/app/ui/screen/main/home/home_screen_view_model.dart';
import 'package:imdb/app/ui/screen/main/main_screen_view_model.dart';
import 'package:imdb/app/ui/screen/main/profile/profile_screen.dart';
import 'package:imdb/app/ui/screen/main/search/search_screen.dart';
import 'package:imdb/app/ui/screen/main/search/search_screen_view_model.dart';
import 'package:imdb/app/ui/screen/main/video/video_screen.dart';
import 'package:imdb/app/ui/screen/widgets/bottom_navigation.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    required this.viewModel,
    super.key,
  });

  final MainScreenViewModel viewModel;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final _pageController = PageController(initialPage: 0);
  var _currentPageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) => setState(() => _currentPageIndex = index),
        children: [
          HomeScreen(viewModel: HomeScreenViewModel()),
          SearchScreen(viewModel: SearchScreenViewModel()),
          const VideoScreen(),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: IMDBBottomNavigationBar(
        pageController: _pageController,
        currentIndex: _currentPageIndex,
      ),
    );
  }
}


