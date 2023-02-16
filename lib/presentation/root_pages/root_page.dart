import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/downloads/screen_download.dart';
import 'package:netflix_clone/presentation/fast_laugh/fast_laugh.dart';
import 'package:netflix_clone/presentation/home/home_screen.dart';
import 'package:netflix_clone/presentation/new_and_hot/new_and_hot.dart';
import 'package:netflix_clone/presentation/root_pages/widgets/bottom_navigation.dart';
import 'package:netflix_clone/presentation/search_screen/screen_search.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      const ScreenHome(),
      const ScreenNewAndHot(),
      const ScreenFastAndLaugh(),
      const ScreenSearch(),
      ScreenDownload(),
    ];
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ValueListenableBuilder(
        valueListenable: bottomNavigationBarIndexNotifier,
        builder: (context, index, child) {
          return pages[index];
        },
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
