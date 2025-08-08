import 'package:floor/floor.dart';
import '../../../models/movie_detail_model.dart';

@dao
abstract class MovieDetailDAO {

  @Query("select * from favorites limit :page")
  Future<List<MovieDetailModel>> getFavorites(int page);

  @Query("delete from customer where id=:id")
  Future<void> deleteFavorite(int id);

  @insert
  Future<void> insertFavorite(MovieDetailModel favorite);
}
