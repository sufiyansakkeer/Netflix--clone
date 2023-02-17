import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constant/constants.dart';

class VideoListItem extends StatelessWidget {
  const VideoListItem({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //*left side mute button
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.6),
                  radius: 25,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off_outlined,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://www.themoviedb.org/t/p/w1280/2dmNDqlBIjSiFXRwwaTU7ywwLmT.jpg"),
                    ),
                    kHeight20,
                    VideoActionWidget(
                      icon: Icons.emoji_emotions,
                      title: 'lol',
                    ),
                    kHeight20,
                    VideoActionWidget(
                      icon: Icons.add,
                      title: 'My list',
                    ),
                    kHeight20,
                    VideoActionWidget(
                      icon: Icons.share_outlined,
                      title: 'share',
                    ),
                    kHeight20,
                    VideoActionWidget(
                      icon: Icons.play_arrow,
                      title: 'play',
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionWidget extends StatelessWidget {
  const VideoActionWidget({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 30,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
