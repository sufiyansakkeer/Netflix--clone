import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constant/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
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
    return ListView(
      children: [
        kHeight,
        Container(
          width: 70,
          height: 50,
          color: Color(0xFFC402FF),
        ),
      ],
    );
  }
}

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                'FEB',
                style: TextStyle(fontSize: 20, color: kGreyColor),
              ),
              Text(
                '11',
                style: TextStyle(
                  fontSize: 30,
                  letterSpacing: 5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Image.network(
                      newAndHotImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(0.6),
                      radius: 25,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.volume_off_outlined,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Tall girl 2',
                    style: TextStyle(
                      fontSize: 35,
                      letterSpacing: -5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      CustomButtonWidget(
                        title: 'Remind me',
                        icon: Icons.notifications_none_outlined,
                        onPressed: () {},
                        iconSize: 20,
                        textSize: 12,
                      ),
                      kWidth,
                      CustomButtonWidget(
                        title: 'info',
                        icon: Icons.info_outline,
                        iconSize: 20,
                        textSize: 12,
                        onPressed: () {},
                      ),
                      kWidth,
                    ],
                  ),
                ],
              ),
              kHeight,
              const Text("coming on friday"),
              kHeight,
              const Text(
                "Tall girl 2",
                style: TextStyle(
                  fontSize: 20,
                  color: kGreyColor,
                ),
              ),
              kHeight,
              const Text(
                'Landing the lead in the school musical is a dream come true for jodi, until the pressure sends her confidence - and her relationship - into a tailspin.',
                style: TextStyle(
                  color: kGreyColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
