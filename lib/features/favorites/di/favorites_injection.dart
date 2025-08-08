import 'package:get_it/get_it.dart';

import '../data/repositories/favorites_repository.dart';
import '../domain/repositories/favorites_repository.dart';
import '../domain/usecases/get_favorites_usecase.dart';
import '../presentation/bloc/favorites_bloc.dart';

void registerFavoritesModule(GetIt sl) {
  sl.registerSingleton<FavoritesRepository>(FavoritesRepositoryImpl(sl()));
  sl.registerSingleton<GetFavoritesUseCase>(GetFavoritesUseCase(sl()));
  sl.registerFactory<FavoritesBloc>(() => FavoritesBloc(sl()));
}
