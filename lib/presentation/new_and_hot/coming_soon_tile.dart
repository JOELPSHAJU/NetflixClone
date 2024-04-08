import 'package:flutter/material.dart';
import 'package:netflix/widgets/vedio_widget.dart';
import 'package:netflix/application/models/top_rated/top_rated.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/homePage/screen_home.dart';

class ComingSoonTile extends StatelessWidget {
  const ComingSoonTile({
    super.key,
    required this.topRated,
    required this.size,
  });
  final TopRated topRated;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'FEB',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    '11',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 500,
              width: size.width - 50,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VedioWidget(
                      image: imageBase + topRated.imagePath,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width * .6,
                          child: Text(
                            topRated.title.toUpperCase(),
                            maxLines: 1,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold,
                                fontSize: 35),
                          ),
                        ),
                        const Spacer(),
                        const Row(
                          children: [
                            CustomIconButton(
                              icon: Icons.notifications_none,
                              label: 'Remind Me',
                              iconsize: 20,
                              textsize: 10,
                            ),
                            width,
                            CustomIconButton(
                              icon: Icons.info_outline,
                              label: 'Info',
                              iconsize: 20,
                              textsize: 10,
                            ),
                            width
                          ],
                        ),
                      ],
                    ),
                    Text("Coming on ${topRated.releaseDate}"),
                    height,
                    Text(
                      topRated.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 23),
                    ),
                    Text(topRated.overview),
                    height
                  ]),
            ),
          ],
        ),
      ],
    );
  }
}
