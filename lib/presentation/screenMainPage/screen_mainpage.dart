import 'package:flutter/material.dart';
import 'package:netflix/Widgets/bottom_nav.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/FastLaughs/screen_fast_laughs.dart';
import 'package:netflix/presentation/HomePage/screen_home.dart';
import 'package:netflix/presentation/NewAndHot/screen_new_and_hot.dart';
import 'package:netflix/presentation/Search/sreen_search.dart';
import 'package:netflix/presentation/downloads/widgets/screen_downloads.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final _pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastLaughs(),
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
