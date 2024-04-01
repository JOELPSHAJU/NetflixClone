import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/HomePage/main_title.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

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
              ListView(
                children: [
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                  const MainTitle(title: 'Released in the past year'),
                  height,
                  SizedBox(
                    width: double.infinity,
                    height: 220,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children:
                            List.generate(30, (index) => const MainCard())),
                  ),
                  height,
                  const MainTitle(title: 'Trending Now'),
                  height,
                  SizedBox(
                    width: double.infinity,
                    height: 220,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children:
                            List.generate(30, (index) => const MainCard())),
                  ),
                  height,
                  const MainTitle(title: 'Top 10 TV Shows In India Today'),
                  height,
                  LimitedBox(
                    maxHeight: 200,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                            10,
                            (index) => MainCardCustom(
                                  index: index,
                                ))),
                  ),
                  height,
                  const MainTitle(title: 'Tense Dramas'),
                  height,
                  SizedBox(
                    width: double.infinity,
                    height: 220,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children:
                            List.generate(30, (index) => const MainCard())),
                  ),
                  height,
                  const MainTitle(title: 'South Indian Cinema'),
                  height,
                  SizedBox(
                    width: double.infinity,
                    height: 220,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children:
                            List.generate(30, (index) => const MainCard())),
                  ),
                ],
              ),
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
                                color: Colors.blue,
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

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 160,
        height: 220,
        decoration: BoxDecoration(
            borderRadius: radius,
            image: const DecorationImage(
                image: NetworkImage(
                  'https://image.tmdb.org/t/p/original/7neAOlqR56CEcQGkQM4VKsVcSMU.jpg',
                ),
                fit: BoxFit.cover)),
      ),
    );
  }
}

class MainCardCustom extends StatelessWidget {
  final int index;
  const MainCardCustom({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 220,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 1000),
              width: 160,
              height: 220,
              decoration: BoxDecoration(
                  borderRadius: radius,
                  image: const DecorationImage(
                      image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjnkFItuYOJ6q9OKUFrbh-aOIqYOt2cQfXiw&usqp=CAU',
                      ),
                      fit: BoxFit.cover)),
            ),
          ],
        ),
        Positioned(
            left: 10,
            bottom: -20,
            child: BorderedText(
              strokeWidth: 8,
              strokeColor: Colors.white,
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                    fontSize: 100,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    decorationColor: Colors.white),
              ),
            ))
      ],
    );
  }
}
