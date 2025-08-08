import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/usecases/movie_detail_usecase.dart';
import 'movie_detail_event.dart';
import 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetailUseCase _getMovieDetailUseCase;

  MovieDetailBloc(this._getMovieDetailUseCase) : super(const MovieDetailLoading()) {
    on<GetMovieDetail>(onGetMovieDetail);
  }

  void onGetMovieDetail(GetMovieDetail event, Emitter<MovieDetailState> emit) async {
    const MovieDetailLoading();
    final dataState = await _getMovieDetailUseCase(params: event.id);

    if (dataState is DataSuccess) {
      emit(MovieDetailDone(dataState.data!));
    } else {
      emit(const MovieDetailError());
    }
  }
}
