import '../../../../core/resources/data_state.dart';
import '../repositories/favorites_repository.dart';
import '../entities/favorite_entity.dart';
import '../../../../core/usecase/usecase.dart';

class InsertFavoritesUseCase implements UseCase<DataState<int>, FavoriteEntity> {
  final FavoritesRepository _favoritesRepository;

  InsertFavoritesUseCase(this._favoritesRepository);

  @override
  Future<DataState<int>> call({FavoriteEntity? params}) {
    return _favoritesRepository.insertFavorite(params!);
  }
}
