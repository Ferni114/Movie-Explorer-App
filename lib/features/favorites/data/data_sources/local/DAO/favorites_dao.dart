import 'package:floor/floor.dart';
import '../../../models/favorite_model.dart';

@dao
abstract class FavoritesDAO {

  @Query("select * from favorites where title like '%'||:search||'%'")
  Future<List<FavoriteModel>> getFavorites(String search);

  @Query("delete from customer where id=:id")
  Future<void> deleteFavorite(int id);

  @insert
  Future<void> insertFavorite(FavoriteModel favorite);
}
