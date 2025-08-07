import 'package:retrofit/retrofit.dart';
import '../../../../../core/env/env.dart';
import 'package:dio/dio.dart';
import '../../models/searches_model.dart';
part 'searches_service.g.dart';

@RestApi(baseUrl: URL)
abstract class SearchesService {
  factory SearchesService(Dio dio) = _SearchesService;

  @GET('/movie/popular')
  Future<HttpResponse<SearchesModel>> getSearches(
      @Header("Authorization") String token, @Query("page") int page);
}
