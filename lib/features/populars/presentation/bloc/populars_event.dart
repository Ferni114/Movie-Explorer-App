abstract class PopularsEvent {
  final int? page;
  const PopularsEvent({this.page});
}

class GetPopulars extends PopularsEvent {
  const GetPopulars(int page) : super(page: page);
}
