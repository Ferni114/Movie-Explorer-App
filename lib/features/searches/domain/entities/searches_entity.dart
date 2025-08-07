import 'search_entity.dart';

class SearchesEntity {
  final int page;
  final List<SearchEntity> results;
  final int pages;
  final int total;

  SearchesEntity({
    required this.page,
    required this.results,
    required this.pages,
    required this.total,
  });
}
