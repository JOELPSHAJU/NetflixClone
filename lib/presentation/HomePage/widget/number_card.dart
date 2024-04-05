import 'package:flutter/material.dart';
import 'package:netflix/application/models/upcoming/upcoming.dart';
import 'package:netflix/core/colors/constants.dart';

import 'package:netflix/presentation/homePage/widget/custom_card.dart';

class NumberTitleCard extends StatelessWidget {
  NumberTitleCard({super.key, required this.upcoming});

  List<Upcoming> upcoming;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      height,
      height20,
      LimitedBox(
        maxHeight: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
              upcoming.length,
              (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: MainCardCustom(
                        index: index, image: upcoming[index].imagePath),
                  )),
        ),
      ),
    ]);
  }
}
