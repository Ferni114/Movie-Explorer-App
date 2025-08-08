import '../../../../core/resources/data_state.dart';
import '../repositories/movie_detail_repository.dart';
import '../entities/movie_detail_entity.dart';
import '../../../../core/usecase/usecase.dart';

class GetMovieDetailUseCase
    implements UseCase<DataState<MovieDetailEntity>, int> {
  final MovieDetailRepository _movieDetailRepository;

  GetMovieDetailUseCase(this._movieDetailRepository);

  @override
  Future<DataState<MovieDetailEntity>> call({int? params}) {
    return _movieDetailRepository.getMovieDetail(params ?? 1);
  }
}
