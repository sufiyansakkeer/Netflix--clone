import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

class EveryOneWatching extends StatelessWidget {
  const EveryOneWatching({
    super.key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  });
  final String posterPath;
  final String movieName;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        Text(
          movieName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 20,
            color: kWhiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        Text(
          description,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: kGreyColor,
          ),
        ),
        kHeight50,
        VideoWidget(
          imageUrl: posterPath,
        ),
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
