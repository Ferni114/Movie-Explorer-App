import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/usecases/searches_usecase.dart';
import 'searches_event.dart';
import 'searches_state.dart';

class SearchesBloc extends Bloc<SearchesEvent, SearchesState> {
  final GetSearchesUseCase _getSearchesUseCase;

  SearchesBloc(this._getSearchesUseCase) : super(const SearchesLoading()) {
    on<GetSearches>(onGetSearches);
  }

  void onGetSearches(GetSearches event, Emitter<SearchesState> emit) async {
    const SearchesLoading();
    final dataState = await _getSearchesUseCase(params: event.map);

    if (dataState is DataSuccess) {
      emit(SearchesDone(dataState.data!));
    } else {
      emit(const SearchesError());
    }
  }
}
