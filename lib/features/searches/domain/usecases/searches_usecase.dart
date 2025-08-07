import '../../../../core/resources/data_state.dart';
import '../repositories/searches_repository.dart';
import '../entities/searches_entity.dart';
import '../../../../core/usecase/usecase.dart';

class GetSearchesUseCase 
implements UseCase<DataState<SearchesEntity>, int> { 
final SearchesRepository _searchesRepository; 

GetSearchesUseCase(this._searchesRepository); 

@override 
Future<DataState<SearchesEntity>> call({int? params}) { 
return _searchesRepository.getSearches(params ?? 1); 
}
}
