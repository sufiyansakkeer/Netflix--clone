import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

class EveryOneWatching extends StatelessWidget {
  const EveryOneWatching({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        const Text(
          "Friends",
          style: TextStyle(
            fontSize: 20,
            color: kWhiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        const Text(
          'This hit sitcom follows the merry misadventures of six 20-something pals as that navigate the pitfalls of work, life and love in 1990 Manhattan',
          style: TextStyle(
            color: kGreyColor,
          ),
        ),
        kHeight50,
        const VideoWidget(),
        kHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtonWidget(
              title: 'Share',
              icon: Icons.share,
              onPressed: () {},
              iconSize: 25,
              textSize: 16,
            ),
            kWidth,
            CustomButtonWidget(
              title: 'My list',
              icon: Icons.add,
              onPressed: () {},
              iconSize: 25,
              textSize: 16,
            ),
            kWidth,
            CustomButtonWidget(
              title: 'Play',
              icon: Icons.play_arrow,
              onPressed: () {},
              iconSize: 25,
              textSize: 16,
            ),
            kWidth,
          ],
        )
      ],
    );
  }
}
