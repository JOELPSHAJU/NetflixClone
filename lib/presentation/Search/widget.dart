import 'package:flutter/material.dart';

class SearchPageTitle extends StatelessWidget {
  final title;
  const SearchPageTitle({
    super.key,required this.title
  });

  @override
  Widget build(BuildContext context) {
    return  Text(
     title,
      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
    );
  }
}