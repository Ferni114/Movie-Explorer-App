import '../../../../core/resources/data_state.dart';
import '../repositories/populars_repository.dart';
import '../entities/populars_entity.dart';
import '../../../../core/usecase/usecase.dart';

class GetPopularsUseCase implements UseCase<DataState<PopularsEntity>, int> {
  final PopularsRepository _popularsRepository;

  GetPopularsUseCase(this._popularsRepository);

  @override
  Future<DataState<PopularsEntity>> call({int? params}) {
    return _popularsRepository.getPopulars(params ?? 1);
  }
}
