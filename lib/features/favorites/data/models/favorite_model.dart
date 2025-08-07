import 'package:floor/floor.dart';

import '../../domain/entities/favorite_entity.dart';

@Entity(tableName: 'favorites', primaryKeys: ['id'])
class FavoriteModel {
  final int id;
  final String poster;
  final String title;
  final String date;
  final String ranking;

  FavoriteModel({
    required this.id,
    required this.poster,
    required this.title,
    required this.date,
    required this.ranking,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
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

  FavoriteEntity toEntity() {
    return FavoriteEntity(
      id: id,
      poster: poster,
      title: title,
      date: date,
      ranking: ranking,
    );
  }
}
