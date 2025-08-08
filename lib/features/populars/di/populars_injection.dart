import 'package:get_it/get_it.dart';

import '../data/data_sources/remote/populars_service.dart';
import '../data/repositories/populars_repository.dart';
import '../domain/repositories/populars_repository.dart';
import '../domain/usecases/populars_usecase.dart';
import '../presentation/bloc/populars_bloc.dart';

void registerPopularsModule(GetIt sl) {
  sl.registerSingleton<PopularsService>(PopularsService(sl()));
  sl.registerSingleton<PopularsRepository>(PopularsRepositoryImpl(sl()));
  sl.registerSingleton<GetPopularsUseCase>(GetPopularsUseCase(sl()));
  sl.registerFactory<PopularsBloc>(() => PopularsBloc(sl()));
}
