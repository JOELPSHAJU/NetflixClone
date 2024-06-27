import 'package:flutter/material.dart';

import 'package:netflix/application/controller/top_rated/top_rated.dart';
import 'package:netflix/application/controller/upcoming/upcomings.dart';
import 'package:netflix/application/models/top_rated/top_rated.dart';
import 'package:netflix/application/models/upcoming/upcoming.dart';

import 'package:netflix/core/colors/constants.dart';

import 'package:netflix/presentation/new_and_hot/coming_soon_tile.dart';
import 'package:netflix/presentation/new_and_hot/everyones_watching_widget.dart';

class ScreenNewAndHot extends StatefulWidget {
  const ScreenNewAndHot({super.key});

  @override
  State<ScreenNewAndHot> createState() => _ScreenNewAndHotState();
}

class _ScreenNewAndHotState extends State<ScreenNewAndHot> {
  List<TopRated> comingMovies = [];
  List<Upcoming> everyOne = [];

  Future getAllMovies() async {
    comingMovies = await getTopRatedMovies();
    everyOne = await getAllUpcoming();
    setState(() {});
  }

  @override
  void initState() {
    getAllMovies();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: AppBar(
              backgroundColor: Colors.black,
              title: const Text(
                'New & Hot',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30),
              ),
              actions: [
                const Icon(
                  Icons.cast,
                  color: Colors.white,
                ),
                width,
                Container(
                  width: 40,
                  height: 30,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/Images/Screenshot 2024-04-05 140203 (1).png'),
                          fit: BoxFit.cover)),
                ),
                width,
              ],
              bottom: TabBar(
                  isScrollable: true,
                  dividerColor: Colors.black,
                  unselectedLabelStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  tabs: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '🍿Coming Soon',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("👀Everyone's Wacthing"),
                    )
                  ]),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TabBarView(children: [
              ComingSoon(
                comingMovies: comingMovies,
              ),
              EveryonesWatching(everyone: everyOne)
            ]),
          )),
    );
  }
}

// ignore: must_be_immutable
class ComingSoon extends StatelessWidget {
  ComingSoon({super.key, required this.comingMovies});
  List<TopRated> comingMovies = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
        itemCount: comingMovies.length,
        itemBuilder: (context, index) {
          return ComingSoonTile(
            size: size,
            topRated: comingMovies[index],
          );
        });
  }
}

class EveryonesWatching extends StatelessWidget {
  const EveryonesWatching({super.key, required this.everyone});
  final List<Upcoming> everyone;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 30,
        itemBuilder: (BuildContext context, index) {
          return EveryonesWatchingWidget(upcoming: everyone[index]);
        });
  }
}
