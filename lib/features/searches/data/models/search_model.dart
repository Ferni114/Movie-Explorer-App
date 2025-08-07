import '../../domain/entities/search_entity.dart';

class SearchModel {
  final int id;
  final String poster;
  final String title;
  final String date;
  final String ranking;

  SearchModel({
    required this.id,
    required this.poster,
    required this.title,
    required this.date,
    required this.ranking,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      id: json['id'] ?? 0,
      poster: json['poster_path'] ?? '',
      title: json['title'] ?? '',
      date: json['release_date'] ?? '',
      ranking: (json['vote_average'] ?? '').toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'poster_path': poster,
      'title': title,
      'release_date': date,
      'vote_average': ranking,
    };
  }

  SearchEntity toEntity() {
    return SearchEntity(
      id: id,
      poster: poster,
      title: title,
      date: date,
      ranking: ranking,
    );
  }
}
