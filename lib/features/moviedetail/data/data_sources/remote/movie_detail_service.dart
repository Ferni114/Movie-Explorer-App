import 'package:retrofit/retrofit.dart';
import '../../../../../core/env/env.dart';
import 'package:dio/dio.dart';
import '../../models/movie_detail_model.dart';
part 'movie_detail_service.g.dart';

@RestApi(baseUrl: URL)
abstract class MovieDetailService {
  factory MovieDetailService(Dio dio) = _MovieDetailService;

  @GET('/movie/{id}')
  Future<HttpResponse<MovieDetailModel>> getMovieDetail(
      @Header("Authorization") String token, @Path("id") int id);
}
