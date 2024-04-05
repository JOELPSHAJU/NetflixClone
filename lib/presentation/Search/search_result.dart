import 'package:flutter/material.dart';
import 'package:netflix/application/controller/upcoming/upcomings.dart';
import 'package:netflix/application/models/upcoming/upcoming.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/homePage/widget/main_card_widget.dart';
import 'package:netflix/presentation/search/widget.dart';

class SearchResultWidget extends StatefulWidget {
  const SearchResultWidget({super.key});

  @override
  State<SearchResultWidget> createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
  List<Upcoming> popular = [];
  Future getPopular() async {
    popular = await getAllUpcoming();
    setState(() {});
  }

  @override
  void initState() {
    getPopular();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        'Movies & TV',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      height,
      Expanded(
          child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2 / 3.1,
        children: List.generate(popular.length, (index) {
          return MainCard(image: popular[index].imagePath);
        }),
      ))
    ]);
  }
}
