import 'package:flutter/material.dart';

import 'package:netflix/core/colors/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
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
    );
  }
}
