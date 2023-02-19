import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/core/strings.dart';
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
          body: const TabBarView(children: [
            ComingSoonList(),
            EveryoneWatchingList(),
          ])),
    );
  }

//   Widget _buildComingSoon(BuildContext context) {
//     return ListView.separated(
//       itemBuilder: (context, index) => ComingSoonWidget(),
//       separatorBuilder: (context, index) => kWidth,
//       itemCount: 10,
//     );
//   }

  Widget _buildEveryoneWatching() {
    return ListView.separated(
      itemBuilder: (context, index) => const SizedBox(),
      separatorBuilder: (context, index) => kWidth,
      itemCount: 10,
    );
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInComingSoon());
      },
    );
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInComingSoon());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return const Center(
              child: Text('Error While Loading Coming Soon'),
            );
          } else if (state.comingSoon.isEmpty) {
            return const Center(
              child: Text('List is Empty'),
            );
          } else {
            return ListView.separated(
                padding: const EdgeInsets.only(top: 20),
                itemBuilder: (context, index) {
                  final movie = state.comingSoon[index];
                  if (movie.id == null) {
                    return const SizedBox();
                  }
                  String month = '';
                  String day = '';
                  try {
                    final _date = DateTime.parse(movie.releaseDate!);
                    final formattedDate =
                        DateFormat.yMMMMd('en_US').format(_date);
                    month = formattedDate
                        .split(' ')
                        .first
                        .substring(0, 3)
                        .toUpperCase();
                    day = movie.releaseDate!.split('-')[1];
                  } catch (e) {
                    month = '';
                    day = '';
                  }

                  return ComingSoonWidget(
                    id: movie.id.toString(),
                    month: month,
                    day: day,
                    posterPath: "$imageAppendUrl${movie.posterPath}",
                    movieName: movie.originalTitle ?? 'No Title',
                    description: movie.overview ?? 'No description',
                  );
                },
                separatorBuilder: (context, index) => kHeight,
                itemCount: state.comingSoon.length);
          }
        },
      ),
    );
  }
}

class EveryoneWatchingList extends StatelessWidget {
  const EveryoneWatchingList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInEveryOneIsWatching());
      },
    );
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInEveryOneIsWatching());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return const Center(
              child: Text('Error While Loading Coming Soon'),
            );
          } else if (state.everyoneIsWatching.isEmpty) {
            return const Center(
              child: Text('List is Empty'),
            );
          } else {
            return ListView.separated(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                itemBuilder: (context, index) {
                  final tv = state.everyoneIsWatching[index];
                  if (tv.id == null) {
                    return const SizedBox();
                  }

                  return EveryOneWatching(
                      posterPath: "$imageAppendUrl${tv.posterPath}",
                      movieName: tv.originalName ?? 'No Title',
                      description: tv.overview ?? 'No description');
                },
                separatorBuilder: (context, index) => kHeight,
                itemCount: state.everyoneIsWatching.length);
          }
        },
      ),
    );
  }
}
