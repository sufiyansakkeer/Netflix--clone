import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constant/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/coming_soon.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/everyone_watching.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';
import 'package:netflix_clone/presentation/widgets/app_bar_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(
              90,
            ),
            child: AppBar(
              elevation: 0,
              title: const Text(
                'New & Hot',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.cast,
                  ),
                ),
                Container(
                  height: 30,
                  width: 30,
                  color: Colors.blue,
                ),
                kWidth,
              ],
              bottom: TabBar(
                isScrollable: true,
                labelColor: backgroundColor,
                unselectedLabelColor: kWhiteColor,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                indicator: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: kRadius30,
                ),
                tabs: const [
                  Tab(
                    text: "🍿 coming soon",
                  ),
                  Tab(
                    text: "👀 Everyone's Watching",
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(children: [
            _buildComingSoon(context),
            _buildEveryoneWatching(),
          ])),
    );
  }

  Widget _buildComingSoon(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => const ComingSoonWidget(),
      separatorBuilder: (context, index) => kWidth,
      itemCount: 10,
    );
  }

  Widget _buildEveryoneWatching() {
    return ListView.separated(
      itemBuilder: (context, index) => const EveryOneWatching(),
      separatorBuilder: (context, index) => kWidth,
      itemCount: 10,
    );
  }
}
