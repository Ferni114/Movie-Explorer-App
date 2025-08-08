import '../../../../core/resources/data_state.dart';
import '../../domain/entities/searches_entity.dart';
import '../../domain/repositories/searches_repository.dart';
import '../data_sources/remote/searches_service.dart';
import 'dart:io';
import '../../../../../core/env/env.dart';

class SearchesRepositoryImpl extends SearchesRepository {
  final SearchesService _searchesService;
SearchesRepositoryImpl(this._searchesService);

  @override
  Future<DataState<SearchesEntity>> getSearches(Map map) async {
   
    try {
      final response = await _searchesService.getSearches(token, map["query"], map["page"]);
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
