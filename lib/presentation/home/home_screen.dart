import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/home/home_bloc.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/core/strings.dart';
import 'package:netflix_clone/presentation/home/widgets/background_card.dart';

import 'package:netflix_clone/presentation/home/widgets/number_title_card.dart';

import 'package:netflix_clone/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
      },
    );
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (context, scrollValue, _) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  // print(direction);
                  if (direction == ScrollDirection.reverse) {
                    scrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotifier.value = true;
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state.isLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          );
                        } else if (state.hasError) {
                          return const Center(
                            child: Text("Error while getting data"),
                          );
                        } else {
                          //*released Past year
                          final releasedPastYear =
                              state.pastYearMovieList.map((e) {
                            return "$imageAppendUrl${e.posterPath}";
                          }).toList();

                          //*trending movie list
                          final trendingMovieList =
                              state.trendingMovieList.map((e) {
                            return "$imageAppendUrl${e.posterPath}";
                          }).toList();
                          //*trends dramas list
                          final trendsDramasList =
                              state.trendsDramasMovieList.map((e) {
                            return "$imageAppendUrl${e.posterPath}";
                          }).toList();

                          //*trends dramas list
                          final southIndianList =
                              state.southIndianMovieList.map((e) {
                            return "$imageAppendUrl${e.posterPath}";
                          }).toList();

                          //*tv shows  list

                          final tVShowList = state.trendingTVList.map(
                            (e) {
                              return "$imageAppendUrl${e.posterPath}";
                            },
                          ).toList();

                          //*list view
                          return ListView(
                            children: [
                              const BackgroundCard(),
                              if (releasedPastYear.length >= 11)
                                MainTitleCard(
                                  title: 'Released in the past years',
                                  posterList: releasedPastYear.sublist(0, 10),
                                ),
                              kHeight,
                              if (trendingMovieList.length >= 11)
                                MainTitleCard(
                                  title: 'Trending Now',
                                  posterList: trendingMovieList.sublist(0, 10),
                                ),
                              kHeight,
                              NumberTitleCard(
                                postersList: tVShowList.sublist(0, 10),
                              ),
                              kHeight,
                              if (trendsDramasList.length >= 11)
                                MainTitleCard(
                                  title: 'Tense Drama',
                                  posterList: trendsDramasList.sublist(0, 10),
                                ),
                              kHeight,
                              if (southIndianList.length >= 10)
                                MainTitleCard(
                                  title: 'South Indian movies',
                                  posterList: southIndianList.sublist(0, 10),
                                ),
                              kHeight,
                            ],
                          );
                        }
                      },
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
