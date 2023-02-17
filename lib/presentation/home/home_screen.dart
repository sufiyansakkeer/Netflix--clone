import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/core/constant/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/background_card.dart';

import 'package:netflix_clone/presentation/home/widgets/number_title_card.dart';

import 'package:netflix_clone/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (context, scrollValue, _) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  print(direction);
                  if (direction == ScrollDirection.reverse) {
                    scrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotifier.value = true;
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    ListView(
                      children: const [
                        BackgroundCard(),
                        MainTitleCard(
                          title: 'Released in the past years',
                        ),
                        kHeight,
                        MainTitleCard(
                          title: 'Trending Now',
                        ),
                        kHeight,
                        NumberTitleCard(),
                        kHeight,
                        MainTitleCard(
                          title: 'Tense Drama',
                        ),
                        kHeight,
                        MainTitleCard(
                          title: 'South Indian movies',
                        ),
                        kHeight,
                      ],
                    ),
                    scrollNotifier.value
                        ? AnimatedContainer(
                            duration: const Duration(milliseconds: 1000),
                            width: double.infinity,
                            height: 90,
                            color: Colors.black.withOpacity(0.1),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.network(
                                        'https://www.freepnglogos.com/uploads/netflix-logo-circle-png-5.png',
                                        width: 70,
                                        height: 70,
                                      ),
                                      const Spacer(),
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
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      Text(
                                        'TV Shows',
                                        style: kHomeTitleText,
                                      ),
                                      Text(
                                        'Movies',
                                        style: kHomeTitleText,
                                      ),
                                      Text(
                                        'Categories',
                                        style: kHomeTitleText,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        : kHeight,
                  ],
                ),
              );
            }),
      ),
    );
  }
}
