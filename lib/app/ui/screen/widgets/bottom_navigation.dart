import 'package:flutter/material.dart';
import 'package:imdb_localization/strings.g.dart';

class IMDBBottomNavigationBar extends StatefulWidget {
  const IMDBBottomNavigationBar({
    required this.pageController,
    required this.currentIndex,
    super.key,
  });

  final PageController pageController;
  final int currentIndex;


  @override
  State<IMDBBottomNavigationBar> createState() =>
      IMDBBottomNavigationBarState();
}

class IMDBBottomNavigationBarState extends State<IMDBBottomNavigationBar> {


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.currentIndex,

      onTap: (index){
        widget.pageController.jumpToPage(index);
      },

      items:[
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: context.t.main.tabs.home,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.search),
          label: context.t.main.tabs.search,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.slow_motion_video),
          label: context.t.main.tabs.video,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person_pin),
          label: context.t.main.tabs.profile,
        ),
      ],
    );
  }
}