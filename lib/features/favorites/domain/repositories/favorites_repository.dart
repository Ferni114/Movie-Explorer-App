import '../../../../core/resources/data_state.dart';
import '../entities/favorite_entity.dart';

abstract class FavoritesRepository {
  Future<DataState<List<FavoriteEntity>>> getFavorites(int page);
  Future<DataState<int>> deleteFavorite(int id);
  Future<DataState<int>> insertFavorite(FavoriteEntity favorite);
}
