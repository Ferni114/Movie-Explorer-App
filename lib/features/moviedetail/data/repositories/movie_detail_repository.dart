import '../../../../core/resources/data_state.dart';
import '../../domain/entities/movie_detail_entity.dart';
import '../../domain/repositories/movie_detail_repository.dart';
import '../data_sources/remote/movie_detail_service.dart';
import 'dart:io';
import '../../../../../core/env/env.dart';

class MovieDetailRepositoryImpl extends MovieDetailRepository {
  final MovieDetailService _MovieDetailService;

  MovieDetailRepositoryImpl(this._MovieDetailService);

  @override
  Future<DataState<MovieDetailEntity>> getMovieDetail(int id) async {

    try {
      final response = await _MovieDetailService.getMovieDetail(token, id);
      if (response.response.statusCode == HttpStatus.ok) {
        return DataSuccess(response.data.toEntity());
      } else {
        return const DataError(null);
      }
    } catch (e) {
      return const DataError(null);
    }
  }
}
