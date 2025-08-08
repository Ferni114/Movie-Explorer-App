import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

import '../../../../features/favorites/data/models/favorite_model.dart';
import '../../../../features/favorites/data/data_sources/local/DAO/favorites_dao.dart';
part 'app_database.g.dart';

@Database(version: 1, entities: [FavoriteModel])
abstract class AppDatabase extends FloorDatabase {
  FavoritesDAO get favoriteDAO;
}
