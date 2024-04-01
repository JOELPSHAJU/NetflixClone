import 'package:flutter/material.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/Search/widget.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchPageTitle(title: 'Movies & TV'),
        height,
        Expanded(
            child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 1.2 / 1.5,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                shrinkWrap: true,
                children: List.generate(20, (index) {
                  return const MainCard();
                })))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          image: const DecorationImage(
              image: NetworkImage(
                  'https://image.tmdb.org/t/p/original/fDx5lbHcmWxEwYjoizsTXW2mVDr.jpg'),
              fit: BoxFit.fitWidth)),
    );
  }
}
