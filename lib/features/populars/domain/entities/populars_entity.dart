import 'popular_entity.dart';

class PopularsEntity {
  final int page;
  final List<PopularEntity> results;
  final int pages;
  final int total;

  PopularsEntity({
    required this.page,
    required this.results,
    required this.pages,
    required this.total,
  });
}
