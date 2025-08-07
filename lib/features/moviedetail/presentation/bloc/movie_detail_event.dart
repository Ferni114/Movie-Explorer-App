abstract class MovieDetailEvent {
  final int? page;
  const MovieDetailEvent({this.page});
}

class GetMovieDetail extends MovieDetailEvent {
  const GetMovieDetail(int page) : super(page: page);
}
