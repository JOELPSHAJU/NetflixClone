import 'package:flutter/material.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/homePage/main_title.dart';

import 'package:netflix/presentation/homePage/widget/main_card_widget.dart';


class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    super.key,
    required this.titletext,
    required this.movies,
  });

  final String titletext;
  final List movies;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      height,
      MainTitle(title: titletext),
      height,
      LimitedBox(
        maxHeight: 200,
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
                movies.length,
                (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child:
                        MainCard(image: imageBase + movies[index].imagePath)))),
      ),
    ]);
  }
}
