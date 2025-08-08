import '../../../../core/resources/data_state.dart';
import '../../domain/entities/populars_entity.dart';
import '../../domain/repositories/populars_repository.dart';
import '../../data/data_sources/remote/populars_service.dart';
import 'dart:io';
import '../../../../../core/env/env.dart';

class PopularsRepositoryImpl extends PopularsRepository {
  final PopularsService _popularsService;
PopularsRepositoryImpl(this._popularsService);

  @override
  Future<DataState<PopularsEntity>> getPopulars(int page) async {
   
    try {
      final response = await _popularsService.getPopulars(token, page);
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
