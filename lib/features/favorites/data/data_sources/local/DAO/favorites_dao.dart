import 'package:floor/floor.dart';
import '../../../models/favorite_model.dart';

@dao
abstract class FavoritesDAO {

  @Query("select * from favorites limit :page")
  Future<List<FavoriteModel>> getFavorites(int page);

  @Query("delete from customer where id=:id")
  Future<void> deleteFavorite(int id);

  @insert
  Future<void> insertFavorite(FavoriteModel favorite);
}
