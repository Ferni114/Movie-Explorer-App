import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/usecases/populars_usecase.dart';
import 'populars_event.dart';
import 'populars_state.dart';

class PopularsBloc extends Bloc<PopularsEvent, PopularsState> {
  final GetPopularsUseCase _getPopularsUseCase;

  PopularsBloc(this._getPopularsUseCase) : super(const PopularsLoading()) {
    on<GetPopulars>(onGetPopulars);
  }

  void onGetPopulars(GetPopulars event, Emitter<PopularsState> emit) async {
    const PopularsLoading();
    final dataState = await _getPopularsUseCase(params: event.page);

    if (dataState is DataSuccess) {
      emit(PopularsDone(dataState.data!));
    } else {
      emit(const PopularsError());
    }
  }
}
