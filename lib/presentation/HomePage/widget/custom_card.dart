import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

import 'package:netflix/core/colors/constants.dart';

class MainCardCustom extends StatelessWidget {
  const MainCardCustom({Key? key, required this.image, required this.index})
      : super(key: key);

  final int index;
  final String image;

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
                  image: DecorationImage(
                      image: NetworkImage(
                        imageBase + image,
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
