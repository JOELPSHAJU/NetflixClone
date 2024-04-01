import 'package:flutter/material.dart';

import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/HomePage/screen_home.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: AppBar(
              backgroundColor: Colors.black,
              title: const Text(
                'New & Hot',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30),
              ),
              actions: [
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
              bottom: TabBar(
                  isScrollable: true,
                  dividerColor: Colors.black,
                  unselectedLabelStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  tabs: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '🍿Coming Soon',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("👀Everyone's Wacthing"),
                    )
                  ]),
            ),
          ),
          body: const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: TabBarView(children: [ComingSoon(), EveryonesWatching()]),
          )),
    );
  }
}

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      shrinkWrap: true,
      children: [
        ComingSoonTile(size: size),
        ComingSoonTile(size: size),
        ComingSoonTile(size: size)
      ],
    );
  }
}

class ComingSoonTile extends StatelessWidget {
  const ComingSoonTile({
    super.key,
    required this.size,
  });

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
                    Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 200,
                          child: Image.network(
                            'https://bingeddata.s3.amazonaws.com/uploads/2020/11/percy-jackson-sea-of-monsters-1.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.volume_off,
                                color: Colors.white,
                              )),
                        )
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Percy Jack',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 35),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            CustomIconButton(
                              icon: Icons.alarm,
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
                    const Text("Coming on Friday"),
                    height,
                    const Text(
                      'Percy Jackson',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                    ),
                    const Text(
                        "ontrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia."),
                    height
                  ]),
            ),
          ],
        ),
      ],
    );
  }
}

class EveryonesWatching extends StatelessWidget {
  const EveryonesWatching({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('EveryOnes watching'));
  }
}
