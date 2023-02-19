import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/core/strings.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;
  VideoListItemInheritedWidget({
    Key? key,
    required this.widget,
    required this.movieData,
  }) : super(child: widget);
  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class VideoListItem extends StatelessWidget {
  const VideoListItem({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final posterPathData =
        VideoListItemInheritedWidget.of(context)?.movieData.posterPath;
    final videoUrl = dummyVideoUrl[index % dummyVideoUrl.length];
    return Stack(
      children: [
        FastLaughVideoPlayer(videoUrl: videoUrl, onStateChanged: (bool) {}),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //*left side mute button
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.6),
                  radius: 25,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off_outlined,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: posterPathData == null
                          ? null
                          : NetworkImage('$imageAppendUrl$posterPathData'),
                    ),
                    kHeight20,
                    ValueListenableBuilder(
                      valueListenable: likedVideosNotifiers,
                      builder: (BuildContext context,
                          Set<dynamic> newLikedListIds, Widget? _) {
                        final _index = index;
                        if (newLikedListIds.contains(_index)) {
                          return GestureDetector(
                            onTap: () {
                              // BlocProvider.of<FastLaughBloc>(context).add(
                              //   LikedVideo(
                              //     id: _index,
                              //   ),
                              // );
                              likedVideosNotifiers.value.remove(_index);
                              likedVideosNotifiers.notifyListeners();
                            },
                            child: VideoActionWidget(
                              icon: Icons.favorite_sharp,
                              title: 'liked',
                            ),
                          );
                        } else {
                          return GestureDetector(
                            onTap: () {
                              // BlocProvider.of<FastLaughBloc>(context).add(
                              //   LikedVideo(
                              //     id: _index,
                              //   ),
                              // );
                              likedVideosNotifiers.value.add(_index);
                              likedVideosNotifiers.notifyListeners();
                            },
                            child: VideoActionWidget(
                              icon: Icons.favorite_border_sharp,
                              title: 'lol',
                            ),
                          );
                        }
                      },
                    ),
                    kHeight20,
                    const VideoActionWidget(
                      icon: Icons.add,
                      title: 'My list',
                    ),
                    kHeight20,
                    GestureDetector(
                      child: const VideoActionWidget(
                        icon: Icons.share_outlined,
                        title: 'share',
                      ),
                      onTap: () {
                        final movieName =
                            VideoListItemInheritedWidget.of(context)
                                ?.movieData
                                .posterPath;
                        if (movieName != null) {
                          Share.share(movieName);
                        }
                      },
                    ),
                    kHeight20,
                    const VideoActionWidget(
                      icon: Icons.play_arrow,
                      title: 'play',
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionWidget extends StatelessWidget {
  const VideoActionWidget({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 30,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class FastLaughVideoPlayer extends StatefulWidget {
  const FastLaughVideoPlayer(
      {super.key, required this.videoUrl, required this.onStateChanged});
  final String videoUrl;
  final void Function(bool isPlaying) onStateChanged;
  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {
        _videoPlayerController.play();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
            )
          : const Center(
              child: CircularProgressIndicator(
                strokeWidth: 5,
              ),
            ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
