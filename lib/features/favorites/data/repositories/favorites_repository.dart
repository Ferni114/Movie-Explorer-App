import '../../../../core/resources/data_state.dart';
import '../../domain/entities/favorites_entity.dart';
import '../../domain/repositories/favorites_repository.dart';
import '../../data/data_sources/remote/favorites_service.dart';
import 'dart:io';
import '../../../../../core/env/env.dart';

class FavoritesRepositoryImpl extends FavoritesRepository {
  final FavoritesService _FavoritesService;
  FavoritesRepositoryImpl(this._FavoritesService);

  @override
  Future<DataState<FavoritesEntity>> getFavorites(int page) async {

    try {
      final response = await _FavoritesService.getFavorites(token, page);
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
