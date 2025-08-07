import 'package:retrofit/retrofit.dart';
import '../../../../../core/env/env.dart';
import 'package:dio/dio.dart';
import '../../models/favorites_model.dart';
part 'favorites_service.g.dart';

@RestApi(baseUrl: URL)
abstract class FavoritesService {
  factory FavoritesService(Dio dio) = _FavoritesService;

  @GET('/movie/popular')
  Future<HttpResponse<FavoritesModel>> getFavorites(
      @Header("Authorization") String token, @Query("page") int page);
}
