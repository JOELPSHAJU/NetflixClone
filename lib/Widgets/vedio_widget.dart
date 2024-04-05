import 'package:flutter/material.dart';

class VedioWidget extends StatelessWidget {
  final String image;
  const VedioWidget({
    super.key,required this.image
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            image,
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
    );
  }
}
