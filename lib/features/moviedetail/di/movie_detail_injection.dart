import 'package:get_it/get_it.dart';

import '../data/data_sources/remote/movie_detail_service.dart';
import '../data/repositories/movie_detail_repository.dart';
import '../domain/repositories/movie_detail_repository.dart';
import '../domain/usecases/movie_detail_usecase.dart';
import '../presentation/bloc/movie_detail_bloc.dart';

void registerMovieDetailModule(GetIt sl) {
  sl.registerSingleton<MovieDetailService>(MovieDetailService(sl()));
  sl.registerSingleton<MovieDetailRepository>(MovieDetailRepositoryImpl(sl()));
  sl.registerSingleton<GetMovieDetailUseCase>(GetMovieDetailUseCase(sl()));
  sl.registerFactory<MovieDetailBloc>(() => MovieDetailBloc(sl()));
}
