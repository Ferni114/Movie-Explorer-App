import 'popular_model.dart';
import '../../domain/entities/populars_entity.dart';

class PopularsModel {
  final int page;
  final List<PopularModel> results;
  final int pages;
  final int total;

  PopularsModel({
    required this.page,
    required this.results,
    required this.pages,
    required this.total,
  });

  factory PopularsModel.fromJson(Map<String, dynamic> json) {
    return PopularsModel(
      page: json['page'] ?? (0),
      results: (json['results'] as List)
          .map((e) => PopularModel.fromJson(e))
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

  PopularsEntity toEntity() {
    return PopularsEntity(
      page: page,
      pages: pages,
      total: total,
      results: results.map((movie) => movie.toEntity()).toList(),
    );
  }
}
