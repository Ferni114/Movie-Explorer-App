abstract class SearchesEvent {
  final Map? map;
  const SearchesEvent({this.map});
}

class GetSearches extends SearchesEvent {
  const GetSearches(Map map) : super(map: map);
}
