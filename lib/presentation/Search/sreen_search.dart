import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/application/controller/popular/popular.dart';
import 'package:netflix/application/models/popular/popular.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/search/search_idle.dart';

import 'package:netflix/presentation/search/search_result.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  final _controller = TextEditingController();
  List<Popular> popular = [];
  bool isTaped = true;
  Future getPopular() async {
    popular = await getAllPopular();
    setState(() {});
  }

  @override
  void initState() {
    getPopular();
    _controller.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CupertinoSearchTextField(
             onChanged: (value) {
                setState(() {
                  value.isEmpty ? isTaped = true : isTaped = false;
                });
              },
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            suffixIcon: const Icon(
              CupertinoIcons.xmark_circle_fill,
              color: Colors.grey,
            ),
            backgroundColor: Colors.grey.withOpacity(.3),
            style: const TextStyle(color: Colors.white),
          ),
          height,
          _isEmpty(_controller.text),
        ],
      ),
    )));
  }
  Widget _isEmpty(String value) {
    return isTaped
        ? Expanded(child:SearchIdle (popular: popular))
        : const Expanded(child: SearchResultWidget());
  }
}
