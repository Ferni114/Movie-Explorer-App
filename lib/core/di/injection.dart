import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../../../features/populars/data/data_sources/remote/populars_service.dart';
import '../../../features/searches/data/data_sources/remote/searches_service.dart';

import '../../../features/populars/data/repositories/populars_repository.dart';
import '../../../features/searches/data/repositories/searches_repository.dart';
import '../../../features/favorites/data/repositories/favorites_repository.dart';

import '../../../features/populars/domain/repositories/populars_repository.dart';
import '../../../features/searches/domain/repositories/searches_repository.dart';
import '../../../features/favorites/domain/repositories/favorites_repository.dart';

import '../../../features/populars/domain/usecases/populars_usecase.dart';
import '../../../features/searches/domain/usecases/searches_usecase.dart';
import '../../../features/favorites/domain/usecases/favorites_usecase.dart';

import '../../../features/populars/presentation/bloc/populars_bloc.dart';
import '../../../features/searches/presentation/bloc/searches_bloc.dart';
import '../../../features/favorites/presentation/bloc/favorites_bloc.dart';

import '../../app_database.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
//Floor
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

// Dio
  sl.registerSingleton<Dio>(Dio(BaseOptions(
      contentType: 'application/json',
      connectTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10))));

// Services
  sl.registerSingleton<PopularsService>(PopularsService(sl()));
  sl.registerSingleton<SearchesService>(SearchesService(sl()));

// Repositories
  sl.registerSingleton<PopularsRepository>(PopularsRepositoryImpl(sl()));
  sl.registerSingleton<SearchesRepository>(SearchesRepositoryImpl(sl()));
  sl.registerSingleton<FavoritesRepository>(FavoritesRepositoryImpl(sl()));

//UseCases
  sl.registerSingleton<GetPopularsUseCase>(GetPopularsUseCase(sl()));
  sl.registerSingleton<GetSearchesUseCase>(GetSearchesUseCase(sl()));
  sl.registerSingleton<GetFavoritesUseCase>(GetFavoritesUseCase(sl()));
// sl.registerSingleton<GetProductsUseCase>(GetProductsUseCase(sl()));

//Blocks
  sl.registerFactory<PopularsBloc>(() => PopularsBloc(sl()));
  sl.registerFactory<FavoritesBloc>(() => FavoritesBloc(sl()));
  sl.registerFactory<SearchesBloc>(() => SearchesBloc(sl()));
}
