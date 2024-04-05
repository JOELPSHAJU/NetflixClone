import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/application/controller/now_playing/now_playing.dart';
import 'package:netflix/application/controller/popular/popular.dart';
import 'package:netflix/application/controller/top_rated/top_rated.dart';
import 'package:netflix/application/controller/upcoming/upcomings.dart';
import 'package:netflix/application/models/now_playing/now_playing.dart';
import 'package:netflix/application/models/popular/popular.dart';
import 'package:netflix/application/models/top_rated/top_rated.dart';
import 'package:netflix/application/models/upcoming/upcoming.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/homePage/main_title.dart';
import 'package:netflix/presentation/homePage/widget/custom_card.dart';
import 'package:netflix/presentation/homePage/widget/main_tile.dart';
import 'package:netflix/presentation/homePage/widget/number_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  List<TopRated> topRated = [];
  List<Popular> popular = [];
  List<Upcoming> upcoming = [];
  List<NowPlaying> newplaying = [];
  Future getAllMovies() async {
    topRated = await getTopRatedMovies();
    popular = await getAllPopular();
    upcoming = await getAllUpcoming();
    newplaying = await getAllNowPlaying();

    setState(() {});
  }

  @override
  void initState() {
    getAllMovies();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (context, value, child) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              ListView(children: [
                Stack(
                  children: [
                    Container(
                      height: 600,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/original/87jZEVp4FW6GwTx56mbbqIQQF75.jpg'),
                              fit: BoxFit.cover)),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const CustomIconButton(
                            icon: Icons.add,
                            label: 'My List',
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * .053,
                            width: MediaQuery.of(context).size.width * .3,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.play_arrow,
                                  color: Colors.black,
                                  size: 25,
                                ),
                                Text(
                                  'Play',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          const CustomIconButton(
                              icon: Icons.info_outline, label: 'Info')
                        ],
                      ),
                    )
                  ],
                ),
                height,
                MainTitleCard(
                    titletext: "Released in the past year", movies: topRated),
                height,
                const MainTitle(title: 'Top 10 TV Shows In India Today'),
                height,
                NumberTitleCard(
                  upcoming: upcoming,
                ),
                height,
                MainTitleCard(titletext: 'Tense Dramas', movies: topRated),
                height,
                MainTitleCard(
                    titletext: 'South Indian Cinema', movies: popular),
                height,
              ]),
              scrollNotifier.value == true
                  ? Container(
                      width: double.infinity,
                      height: 80,
                      color: Colors.black.withOpacity(.4),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 60,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/Images/NetflixLogo.png'))),
                              ),
                              const Spacer(),
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
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('TV Shows', style: textstyleHomeTitle),
                              Text(
                                'Movies',
                                style: textstyleHomeTitle,
                              ),
                              Text(
                                'Categories',
                                style: textstyleHomeTitle,
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  : height
            ],
          ),
        );
      },
    ));
  }
}

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final double iconsize;
  final double textsize;
  const CustomIconButton(
      {super.key,
      required this.icon,
      required this.label,
      this.textsize = 18,
      this.iconsize = 30});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: iconsize,
          color: Colors.white,
        ),
        Text(
          label,
          style: TextStyle(fontSize: textsize),
        )
      ],
    );
  }
}
