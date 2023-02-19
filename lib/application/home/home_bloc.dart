import 'package:bloc/bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/hot_and_new/hot_and_new_service.dart';
import 'package:netflix_clone/domain/hot_and_new/model/hot_and_new_resp/hot_and_new_resp.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewServices _homeservices;

  HomeBloc(this._homeservices) : super(HomeState.initial()) {
    on<GetHomeScreenData>((event, emit) async {
      //* send loading to ui
      emit(
        state.copyWith(
          isLoading: true,
          hasError: false,
        ),
      );

      //*get data
      final _movieResult = await _homeservices.getHotAndNewMovieData();

      final _tVResult = await _homeservices.getHotAndNewTVData();

      //* transform data

      final _state1 = _movieResult.fold(
        (MainFailure f) {
          return HomeState(
            pastYearMovieList: [],
            trendingMovieList: [],
            trendsDramasMovieList: [],
            southIndianMovieList: [],
            trendingTVList: [],
            isLoading: false,
            hasError: true,
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
          );
        },
        (HotAndNewResp resp) {
          final pastYear = resp.results;
          final trending = resp.results;
          final southIndian = resp.results;
          final dramas = resp.results;

          pastYear!.shuffle();
          trending!.shuffle();
          southIndian!.shuffle();
          dramas!.shuffle();

          return HomeState(
            pastYearMovieList: pastYear,
            trendingMovieList: trending,
            trendsDramasMovieList: southIndian,
            southIndianMovieList: dramas,
            trendingTVList: state.trendingTVList,
            isLoading: false,
            hasError: false,
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
          );
        },
      );

      emit(_state1);

      final _state2 = _tVResult.fold(
        (MainFailure f) {
          return const HomeState(
            pastYearMovieList: [],
            trendingMovieList: [],
            trendsDramasMovieList: [],
            southIndianMovieList: [],
            trendingTVList: [],
            isLoading: false,
            hasError: true,
            stateId: '',
          );
        },
        (HotAndNewResp resp) {
          final top10List = resp.results;

          return HomeState(
            pastYearMovieList: state.pastYearMovieList,
            trendingMovieList: state.trendingMovieList,
            trendsDramasMovieList: state.trendsDramasMovieList,
            southIndianMovieList: state.southIndianMovieList,
            trendingTVList: top10List!,
            isLoading: false,
            hasError: false,
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
          );
        },
      );

      //send to ui

      emit(_state2);
    });
  }
}
