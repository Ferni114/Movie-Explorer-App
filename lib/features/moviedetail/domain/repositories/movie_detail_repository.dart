import '../../../../core/resources/data_state.dart';
import '../entities/movie_detail_entity.dart';

abstract class MovieDetailRepository {
  Future<DataState<MovieDetailEntity>> getMovieDetail(int id);
  Future<DataState<MovieDetailEntity>> getFavorite(int id);
  Future<DataState<MovieDetailEntity>> deleteFavorite(int id);
  Future<DataState<MovieDetailEntity>> insertFavorite(MovieDetailEntity id);
}
