import 'package:equatable/equatable.dart';
import '../../domain/entities/favorite_entity.dart';

abstract class FavoritesState extends Equatable {
  final List<FavoriteEntity>? favorite;

  const FavoritesState({this.favorite});

  @override
  List<Object> get props => [favorite!];
}

class FavoritesLoading extends FavoritesState {
  const FavoritesLoading();
}

class FavoritesDone extends FavoritesState {
  const FavoritesDone(List<FavoriteEntity>? favorite)
      : super(favorite: favorite);
}

class FavoritesError extends FavoritesState {
  const FavoritesError();
}
