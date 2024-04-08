import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/application/models/popular/popular.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/search/widget.dart';

class SearchIdle extends StatelessWidget {
  SearchIdle({super.key, required this.popular});
  List<Popular> popular;
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
              shrinkWrap: true,
              itemBuilder: (ctx, index) => TopSearchItemTile(
                  url: popular[index].imagePath,
                  movieName: popular[index].title),
              separatorBuilder: (ctx, index) => height20,
              itemCount: popular.length),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
    final String url;
  final String movieName;

  const TopSearchItemTile(
      {super.key, required this.movieName, required this.url});

  @override
  Widget build(BuildContext context) {
 
    // ignore: non_constant_identifier_names
    final Screensize = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          height: 70,
          width: Screensize * .35,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageBase + url), fit: BoxFit.cover)),
        ),
        width,
        Expanded(
            child: SearchPageTitle(
          title: movieName,
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
