import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/HomePage/main_title.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 600,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://cdn.gulte.com/wp-content/uploads/2021/10/Shyam.jpeg'),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.white,
                        ),
                        Text(
                          'My List',
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                    TextButton.icon(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white)),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.play_arrow,
                          size: 25,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        label: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Play',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
          height,
          const MainTitle(title: 'Released in the past year'),
          height,
          Container(
            width: double.infinity,
            height: 220,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(30, (index) => const MainCard())),
          ),
          height,
          const MainTitle(title: 'Trending Now'),
          height,
          Container(
            width: double.infinity,
            height: 220,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(30, (index) => const MainCard())),
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
          Container(
            width: double.infinity,
            height: 220,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(30, (index) => const MainCard())),
          ),
          height,
          const MainTitle(title: 'South Indian Cinema'),
          height,
          Container(
            width: double.infinity,
            height: 220,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(30, (index) => const MainCard())),
          ),
        ],
      ),
    ));
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
            Container(
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
