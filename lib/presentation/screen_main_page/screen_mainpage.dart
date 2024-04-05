import 'package:flutter/material.dart';
import 'package:netflix/widgets/bottom_nav.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/fast_laughs/screen_fast_laughs.dart';
import 'package:netflix/presentation/homePage/screen_home.dart';
import 'package:netflix/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix/presentation/search/sreen_search.dart';
import 'package:netflix/presentation/downloads/screen_downloads.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final _pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastLaugh(),
    const ScreenSearch(),
    ScreenDownloads()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: ValueListenableBuilder(
            valueListenable: indexChangeNotifier,
            builder: (BuildContext context, int index, Widget? _) {
              return _pages[index];
            },
          ),
        ),
        backgroundColor: backgroundColor,
        bottomNavigationBar: const BottomNavigationWidget());
  }
}
