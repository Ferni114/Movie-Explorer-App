abstract class MovieDetailEvent {
  final int? id;
  const MovieDetailEvent({this.id});
}

class GetMovieDetail extends MovieDetailEvent {
  const GetMovieDetail(int id) : super(id: id);
}
