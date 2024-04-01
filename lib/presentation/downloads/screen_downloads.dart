import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/Widgets/app_bar_widget.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constants.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  final widgetlist = [const SmartWidget(), const Section2(), const Section3()];
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: AppBarWidget(
                title: 'Downloads',
              ),
            )),
        body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) => widgetlist[index],
            separatorBuilder: (context, index) => const SizedBox(
                  height: 25,
                ),
            itemCount: widgetlist.length));
  }
}

class SmartWidget extends StatelessWidget {
  const SmartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        width,
        Icon(
          Icons.settings,
          color: Colors.white,
        ),
        width,
        Text(
          'Smart Downloads',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        )
      ],
    );
  }
}

class ImageTIle extends StatelessWidget {
  const ImageTIle(
      {super.key,
      required this.angle,
      required this.size,
      required this.margin,
      required this.image});

  final double angle;
  final String image;
  final Size size;

  // ignore: prefer_typing_uninitialized_variables
  final margin;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 100,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        height,
        const Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
        ),
        height,
        const Text(
          "We will download a personalized selection of\nmovies and shows for you, so ther's \nalways something to watch on your device",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: size.width * .39,
                  backgroundColor: const Color.fromARGB(120, 158, 158, 158),
                ),
              ),
              ImageTIle(
                  size: Size(size.width * .4, size.height * .25),
                  angle: 8,
                  margin: const EdgeInsets.only(left: 180, bottom: 38, top: 27),
                  image:
                      'https://image.tmdb.org/t/p/original/9poaVzGSMMDuSXB1w3kEh1XubKx.jpg'),
              ImageTIle(
                  size: Size(size.width * .4, size.height * .25),
                  angle: -8,
                  margin:
                      const EdgeInsets.only(right: 180, bottom: 38, top: 27),
                  image:
                      'https://image.tmdb.org/t/p/original/lFx2i2pg1BoaD7grcpGDyHM1eML.jpg'),
              ImageTIle(
                  size: Size(
                    size.width * .4,
                    size.height * .28,
                  ),
                  angle: 0,
                  margin: const EdgeInsets.only(left: 0, top: 27),
                  image:
                      'https://image.tmdb.org/t/p/original/2NbuLNZabhaNjbaBDklZg98TxmG.jpg')
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: MaterialButton(
            onPressed: () {},
            color: kbuttonColorBlue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Setup',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        height,
        MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onPressed: () {},
          color: kbuttonColorWhite,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See what you can download',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
