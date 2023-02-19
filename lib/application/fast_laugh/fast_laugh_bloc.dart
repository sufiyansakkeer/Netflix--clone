import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final dummyVideoUrl = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
];

ValueNotifier<Set> likedVideosNotifiers = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(IDownloadRepo _downloadServices)
      : super(FastLaughState.initial()) {
    on<Initialized>(
      (event, emit) async {
        //for giving loading in ui

        emit(const FastLaughState(
          videoList: [],
          isLoading: true,
          isError: false,
        ));
        //get trending movies
        final _result = await _downloadServices.getDownloadsImage();

        final _state = _result.fold((l) {
          return FastLaughState(
            videoList: [],
            isLoading: false,
            isError: true,
          );
        }, (resp) {
          return FastLaughState(
            videoList: resp,
            isLoading: false,
            isError: false,
          );
        });
        //sent to ui

        emit(_state);
      },
    );
    on<LikedVideo>((event, emit) {
      likedVideosNotifiers.value.add(event.id);
    });
    on<UnLikeVideo>((event, emit) {
      likedVideosNotifiers.value.remove(event.id);
    });
  }
}
