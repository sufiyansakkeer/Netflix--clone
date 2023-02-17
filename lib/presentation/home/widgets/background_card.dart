import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/uJYYizSuA9Y3DCs0qS4qWvHfZg4.jpg",
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButtonWidget(
                  icon: Icons.add,
                  onPressed: () {},
                  title: 'My list',
                ),
                _playButton(),
                CustomButtonWidget(
                  title: 'info',
                  icon: Icons.info_outline,
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.white)),
      onPressed: () {},
      icon: const Icon(Icons.play_arrow, size: 30, color: Colors.black),
      label: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Text(
          'Play',
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
      ),
    );
  }
}
