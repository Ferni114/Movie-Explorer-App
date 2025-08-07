import '../../domain/entities/popular_entity.dart';

class PopularModel {
  final int id;
  final String poster;
  final String title;
  final String date;
  final String ranking;

  PopularModel({
    required this.id,
    required this.poster,
    required this.title,
    required this.date,
    required this.ranking,
  });

  factory PopularModel.fromJson(Map<String, dynamic> json) {
    return PopularModel(
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

  PopularEntity toEntity() {
    return PopularEntity(
      id: id,
      poster: poster,
      title: title,
      date: date,
      ranking: ranking,
    );
  }
}
