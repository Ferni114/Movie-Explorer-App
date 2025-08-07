import '../../../../core/resources/data_state.dart';
import '../entities/favorites_entity.dart';

abstract class FavoritesRepository {
  Future<DataState<FavoritesEntity>> getFavorites(int page);
}
