import 'search_model.dart';
import '../../domain/entities/searches_entity.dart';

class SearchesModel {
  final int page;
  final List<SearchModel> results;
  final int pages;
  final int total;

  SearchesModel({
    required this.page,
    required this.results,
    required this.pages,
    required this.total,
  });

  factory SearchesModel.fromJson(Map<String, dynamic> json) {
    return SearchesModel(
      page: json['page'] ?? (0),
      results: (json['results'] as List)
          .map((e) => SearchModel.fromJson(e))
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

  SearchesEntity toEntity() {
    return SearchesEntity(
      page: page,
      pages: pages,
      total: total,
      results: results.map((movie) => movie.toEntity()).toList(),
    );
  }
}
