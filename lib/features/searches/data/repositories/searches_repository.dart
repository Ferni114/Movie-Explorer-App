import '../../../../core/resources/data_state.dart';
import '../../domain/entities/searches_entity.dart';
import '../../domain/repositories/searches_repository.dart';
import '../data_sources/remote/searches_service.dart';
import 'dart:io';
import '../../../../../core/env/env.dart';

class SearchesRepositoryImpl extends SearchesRepository {
  final SearchesService _searchesService;
  // final SharedPreferencesInt _sharedPreferences;
  // SearchesRepositoryImpl(this._SearchesService, this._sharedPreferences);
SearchesRepositoryImpl(this._searchesService);

  @override
  Future<DataState<SearchesEntity>> getSearches(int page) async {
    /* bool isOnline = await hasNetwork();
    if (!isOnline) {
      return DataError(null);
    } */
    /*final token = await _sharedPreferences.getToken();
    if (token == "") {
      return DataError(null);
    } */
   
    try {
      final response = await _searchesService.getSearches(token, page);
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
