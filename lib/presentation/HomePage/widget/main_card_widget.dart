import 'package:flutter/material.dart';
import 'package:netflix/core/colors/constants.dart';

class MainCard extends StatelessWidget {
  MainCard({super.key, required this.image});
  String imageBase = 'https://image.tmdb.org/t/p/w355_and_h200_multi_faces';
  String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
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
    );
  }
}
