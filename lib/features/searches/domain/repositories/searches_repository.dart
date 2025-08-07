import '../../../../core/resources/data_state.dart';
import '../entities/searches_entity.dart';

abstract class SearchesRepository {
  Future<DataState<SearchesEntity>> getSearches(int page);
}
