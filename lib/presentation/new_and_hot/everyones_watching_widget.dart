import 'package:flutter/material.dart';
import 'package:netflix/widgets/vedio_widget.dart';
import 'package:netflix/application/models/upcoming/upcoming.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/homePage/screen_home.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  EveryonesWatchingWidget({
    super.key,
    required this.upcoming,
  });
  Upcoming upcoming;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            width,
            Text(
              upcoming.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ],
        ),
        Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8),
            child: Text(upcoming.overview)),
        height50,
        VedioWidget(
          image: imageBase + upcoming.imagePath,
        ),
        height,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomIconButton(
              icon: Icons.share,
              label: 'Share',
              iconsize: 25,
              textsize: 16,
            ),
            width,
            CustomIconButton(
              icon: Icons.add,
              label: 'My List',
              iconsize: 25,
              textsize: 16,
            ),
            width,
            CustomIconButton(
              icon: Icons.play_arrow,
              label: 'Play',
              iconsize: 25,
              textsize: 16,
            ),
            width,
          ],
        )
      ],
    );
  }
}
