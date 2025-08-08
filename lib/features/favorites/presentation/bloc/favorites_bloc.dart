import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/usecases/get_favorites_usecase.dart';
import 'favorites_event.dart';
import 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final GetFavoritesUseCase _getFavoritesUseCase;

  FavoritesBloc(this._getFavoritesUseCase) : super(const FavoritesLoading()) {
    on<GetFavorites>(onGetFavorites);
  }

  void onGetFavorites(GetFavorites event, Emitter<FavoritesState> emit) async {
    const FavoritesLoading();
    final dataState = await _getFavoritesUseCase(params: event.page);

    if (dataState is DataSuccess) {
      emit(FavoritesDone(dataState.data!));
    } else {
      emit(const FavoritesError());
    }
  }
}
