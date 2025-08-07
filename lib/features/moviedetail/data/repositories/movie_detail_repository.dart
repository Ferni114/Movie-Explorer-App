import '../../../../core/resources/data_state.dart';
import '../../domain/entities/movie_detail_entity.dart';
import '../../domain/repositories/movie_detail_repository.dart';
import '../data_sources/remote/movie_detail_service.dart';
import 'dart:io';
import '../../../../../core/env/env.dart';

class MovieDetailRepositoryImpl extends MovieDetailRepository {
  final MovieDetailService _MovieDetailService;
  // final SharedPreferencesInt _sharedPreferences;
  // MovieDetailRepositoryImpl(this._MovieDetailService, this._sharedPreferences);
MovieDetailRepositoryImpl(this._MovieDetailService);

  @override
  Future<DataState<MovieDetailEntity>> getMovieDetail(int page) async {
    /* bool isOnline = await hasNetwork();
    if (!isOnline) {
      return DataError(null);
    } */
    /*final token = await _sharedPreferences.getToken();
    if (token == "") {
      return DataError(null);
    } */
   
    try {
      final response = await _MovieDetailService.getMovieDetail(token, page);
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
