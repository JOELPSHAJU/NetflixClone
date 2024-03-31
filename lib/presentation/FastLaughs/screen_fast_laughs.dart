import 'package:flutter/material.dart';
import 'package:netflix/presentation/FastLaughs/widgets.dart';

class ScreenFastLaughs extends StatelessWidget {
  const ScreenFastLaughs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PageView(
              scrollDirection: Axis.vertical,
              children:
                  List.generate(20, (index) => VedioListItem(index: index)))),
    );
  }
}
