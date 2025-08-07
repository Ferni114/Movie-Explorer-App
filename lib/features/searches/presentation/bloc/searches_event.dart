abstract class SearchesEvent {
  final int? page;
  const SearchesEvent({this.page});
}

class GetSearches extends SearchesEvent {
  const GetSearches(int page) : super(page: page);
}
