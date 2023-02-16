import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/fast_laugh/widgets/video_list_item.dart';

class ScreenFastAndLaugh extends StatelessWidget {
  const ScreenFastAndLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: PageView(
            scrollDirection: Axis.vertical,
            children: List.generate(
              10,
              (index) => VideoListItem(
                index: index,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
