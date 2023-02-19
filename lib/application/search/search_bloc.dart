import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';
import 'package:netflix_clone/domain/search/model/search_resp/search_resp.dart';
import 'package:netflix_clone/domain/search/search_services.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadRepo _downloadServices;
  final SearchService _searchService;
  SearchBloc(this._downloadServices, this._searchService)
      : super(SearchState.initial()) {
    //*idle _state
    on<Initialized>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(
          SearchState(
            searchResult: [],
            idleList: state.idleList,
            isLoading: false,
            isError: false,
          ),
        );
        return;
      }
      emit(
        const SearchState(
          searchResult: [],
          idleList: [],
          isLoading: true,
          isError: false,
        ),
      );
      //get trending
      final _result = await _downloadServices.getDownloadsImage();
      final _state = _result.fold(
        (MainFailure f) {
          return const SearchState(
            searchResult: [],
            idleList: [],
            isLoading: false,
            isError: true,
          );
        },
        (List<Downloads> list) {
          return SearchState(
            searchResult: [],
            idleList: list,
            isLoading: false,
            isError: false,
          );
        },
      );
      emit(_state);
      //show to ui
    });

    //*search result _state
    on<SearchMovies>((event, emit) {
      //show search movie api
      _searchService.searchMovies(movieQuery: event.movieQuery);
      //show to ui
    });
  }
}
