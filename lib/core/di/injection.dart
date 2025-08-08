import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../../../features/populars/di/populars_injection.dart';
import '../../../features/searches/di/searches_injection.dart';
import '../../../features/favorites/di/favorites_injection.dart';
import '../../../features/moviedetail/di/movie_detail_injection.dart';

import '../db/app_database.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  sl.registerSingleton<Dio>(Dio(BaseOptions(
      contentType: 'application/json',
      connectTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10))));

  registerPopularsModule(sl);
  registerSearchesModule(sl);
  registerFavoritesModule(sl);
  registerMovieDetailModule(sl);
}
