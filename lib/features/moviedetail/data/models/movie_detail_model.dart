import 'package:floor/floor.dart';
import '../../domain/entities/movie_detail_entity.dart';

@Entity(tableName: 'favorites', primaryKeys: ['id'])
class MovieDetailModel {
  final int id;
  final String poster;
  final String title;
  final String date;
  final String ranking;
  final String synopsis;
  final String genre;

  MovieDetailModel({
    required this.id,
    required this.poster,
    required this.title,
    required this.date,
    required this.ranking,
    required this.synopsis,
    required this.genre,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      id: json['id'] ?? 0,
      poster: json['poster_path'] ?? '',
      title: json['title'] ?? '',
      date: json['release_date'] ?? '',
      ranking: (json['vote_average'] ?? '').toString(),
      synopsis: json['overview'] ?? '',
      genre: json['genre'] ?? 'Action',
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

  MovieDetailEntity toEntity() {
    return MovieDetailEntity(
      id: id,
      poster: poster,
      title: title,
      date: date,
      ranking: ranking,
      synopsis: synopsis,
      genre: genre,
    );
  }
}
