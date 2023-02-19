import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/hot_and_new/hot_and_new_service.dart';
import 'package:netflix_clone/domain/hot_and_new/model/hot_and_new_resp/hot_and_new_resp.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewServices _hotAndNewServices;
  HotAndNewBloc(this._hotAndNewServices) : super(HotAndNewState.initial()) {
    //

    //get hot and new data in movie
    on<LoadDataInComingSoon>((event, emit) async {
      //send loading to ui
      emit(
        const HotAndNewState(
          comingSoon: [],
          everyoneIsWatching: [],
          isLoading: true,
          hasError: false,
        ),
      );

      //get data from remote
      final result = await _hotAndNewServices.getHotAndNewMovieData();

      //data to state
      final newState = result.fold((MainFailure f) {
        return const HotAndNewState(
          comingSoon: [],
          everyoneIsWatching: [],
          isLoading: false,
          hasError: true,
        );
      }, (HotAndNewResp resp) {
        return HotAndNewState(
          comingSoon: resp.results!,
          everyoneIsWatching: state.everyoneIsWatching,
          isLoading: false,
          hasError: false,
        );
      });
      emit(newState);
    });

    //get hot and new data in TV
    on<LoadDataInEveryOneIsWatching>((event, emit) async {
      emit(
        const HotAndNewState(
          comingSoon: [],
          everyoneIsWatching: [],
          isLoading: true,
          hasError: false,
        ),
      );

      //get data from remote
      final result = await _hotAndNewServices.getHotAndNewTVData();

      //data to state
      final newState = result.fold((MainFailure f) {
        return const HotAndNewState(
          comingSoon: [],
          everyoneIsWatching: [],
          isLoading: false,
          hasError: true,
        );
      }, (HotAndNewResp resp) {
        return HotAndNewState(
          comingSoon: state.comingSoon,
          everyoneIsWatching: resp.results!,
          isLoading: false,
          hasError: false,
        );
      });
      emit(newState);
    });
  }
}
