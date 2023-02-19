part of 'hot_and_new_bloc.dart';

@freezed
class HotAndNewState with _$HotAndNewState {
  const factory HotAndNewState({
    required List<HotAndNewData> comingSoon,
    required List<HotAndNewData> everyoneIsWatching,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;

  factory HotAndNewState.initial() => const HotAndNewState(
      comingSoon: [],
      everyoneIsWatching: [],
      isLoading: false,
      hasError: false);
}
