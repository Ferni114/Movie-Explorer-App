import 'package:movie_explorer_app/core/db/app_database.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/entities/favorite_entity.dart';
import '../../domain/repositories/favorites_repository.dart';
import '../../data/models/favorite_model.dart';

class FavoritesRepositoryImpl extends FavoritesRepository {
  final AppDatabase _appDatabase;
  FavoritesRepositoryImpl(this._appDatabase);

  @override
  Future<DataState<List<FavoriteEntity>>> getFavorites(int page) async {
    try {
      final response = await _appDatabase.favoriteDAO.getFavorites(page);
      final entities = response.map((model) => model.toEntity()).toList();
      return DataSuccess(entities);
    } catch (e) {
      return const DataError(null);
    }
  }

  @override
  Future<DataState<int>> deleteFavorite(int id) async {
    try {
      await _appDatabase.favoriteDAO.deleteFavorite(id);
      return const DataSuccess(1);
    } catch (e) {
      return const DataError(null);
    }
  }

  @override
  Future<DataState<int>> insertFavorite(FavoriteEntity favorite) async {
    try {
      final model = FavoriteModel.fromEntity(favorite);
      await _appDatabase.favoriteDAO.insertFavorite(model);
      return const DataSuccess(1);
    } catch (e) {
      return const DataError(null);
    }
  }
}
