import 'favorite_entity.dart';

class FavoritesEntity {
  final int page;
  final List<FavoriteEntity> results;
  final int pages;
  final int total;

  FavoritesEntity({
    required this.page,
    required this.results,
    required this.pages,
    required this.total,
  });
}
