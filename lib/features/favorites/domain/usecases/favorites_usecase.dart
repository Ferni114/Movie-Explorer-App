import '../../../../core/resources/data_state.dart';
import '../repositories/favorites_repository.dart';
import '../entities/favorites_entity.dart';
import '../../../../core/usecase/usecase.dart';

class GetFavoritesUseCase implements UseCase<DataState<FavoritesEntity>, int> {
  final FavoritesRepository _favoritesRepository;

  GetFavoritesUseCase(this._favoritesRepository);

  @override
  Future<DataState<FavoritesEntity>> call({int? params}) {
    return _favoritesRepository.getFavorites(params ?? 1);
  }
}
