import 'package:flutter/material.dart';

class VedioListItem extends StatelessWidget {
  final int index;
  const VedioListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ///left side
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black.withOpacity(.5),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.volume_mute,
                        size: 26,
                        color: Colors.white,
                      )),
                ),

                ///right side
                const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://image.tmdb.org/t/p/original/4gcvEpZQ15nDjQupWdWUgLoFDrz.jpg'),
                      radius: 30,
                    ),
                    VideoActions(icon: Icons.emoji_emotions, title: 'LOL'),
                    VideoActions(icon: Icons.add, title: 'My List'),
                    VideoActions(icon: Icons.share, title: 'Share'),
                    VideoActions(icon: Icons.play_arrow, title: 'Play'),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActions extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActions({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
