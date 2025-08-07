import 'Favorite_model.dart';
import '../../domain/entities/favorites_entity.dart';

class FavoritesModel {
  final int page;
  final List<FavoriteModel> results;
  final int pages;
  final int total;

  FavoritesModel({
    required this.page,
    required this.results,
    required this.pages,
    required this.total,
  });

  factory FavoritesModel.fromJson(Map<String, dynamic> json) {
    return FavoritesModel(
      page: json['page'] ?? (0),
      results: (json['results'] as List)
          .map((e) => FavoriteModel.fromJson(e))
          .toList(),
      pages: json['total_pages'] ?? (0),
      total: json['total_results'] ?? (0),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': results.map((e) => e.toJson()).toList(),
      'total_pages': pages,
      'total_results': total,
    };
  }

  FavoritesEntity toEntity() {
    return FavoritesEntity(
      page: page,
      pages: pages,
      total: total,
      results: results.map((movie) => movie.toEntity()).toList(),
    );
  }
}
