import '../../../../core/resources/data_state.dart';
import '../entities/populars_entity.dart';

abstract class PopularsRepository { 
Future<DataState<PopularsEntity>> getPopulars(int page);
}