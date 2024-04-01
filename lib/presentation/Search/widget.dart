import 'package:flutter/material.dart';

class SearchPageTitle extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final title;
  const SearchPageTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
    );
  }
}
