part of 'fast_laugh_bloc.dart';

@freezed
class FastLaughEvent with _$FastLaughEvent {
  const factory FastLaughEvent.initialized() = Initialized;
  const factory FastLaughEvent.likedVideo({
    required int id,
  }) = LikedVideo;
  const factory FastLaughEvent.unLikeVideo({
    required int id,
  }) = UnLikeVideo;
}
