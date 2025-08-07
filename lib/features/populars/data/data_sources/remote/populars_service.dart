import 'package:retrofit/retrofit.dart';
import '../../../../../core/env/env.dart';
import 'package:dio/dio.dart';
import '../../models/populars_model.dart';
part 'populars_service.g.dart';

@RestApi(baseUrl: URL)
abstract class PopularsService {
  factory PopularsService(Dio dio) = _PopularsService;

  @GET('/movie/popular')
  Future<HttpResponse<PopularsModel>> getPopulars(
      @Header("Authorization") String token, @Query("page") int page);
}
