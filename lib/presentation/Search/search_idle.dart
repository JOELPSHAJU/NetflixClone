import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/Search/widget.dart';

class SearchIdle extends StatelessWidget {
  const SearchIdle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Top Searches',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        height,
        Expanded(
          child: ListView.separated(
              itemBuilder: (ctx, index) => const TopSearchItemTile(),
              separatorBuilder: (ctx, index) => height20,
              itemCount: 10),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final Screensize = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          height: 70,
          width: Screensize * .35,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://image.tmdb.org/t/p/original/JhdlrOKjZyPA6Txg8PgvjqQmIK.jpg'))),
        ),
        const Expanded(
            child: SearchPageTitle(
          title: 'Movie Name',
        )),
        const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 23,
            child: Center(
              child: Icon(
                CupertinoIcons.play_fill,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
