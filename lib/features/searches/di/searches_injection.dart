import 'package:get_it/get_it.dart';

import '../data/data_sources/remote/searches_service.dart';
import '../data/repositories/searches_repository.dart';
import '../domain/repositories/searches_repository.dart';
import '../domain/usecases/searches_usecase.dart';
import '../presentation/bloc/searches_bloc.dart';

void registerSearchesModule(GetIt sl) {
  sl.registerSingleton<SearchesService>(SearchesService(sl()));
  sl.registerSingleton<SearchesRepository>(SearchesRepositoryImpl(sl()));
  sl.registerSingleton<GetSearchesUseCase>(GetSearchesUseCase(sl()));
  sl.registerFactory<SearchesBloc>(() => SearchesBloc(sl()));
}
