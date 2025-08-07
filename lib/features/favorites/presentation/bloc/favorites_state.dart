import 'package:equatable/equatable.dart';
import '../../domain/entities/favorites_entity.dart';

abstract class FavoritesState extends Equatable {
  final FavoritesEntity? popular;

  const FavoritesState({this.popular});

  @override
  List<Object> get props => [popular!];
}

class FavoritesLoading extends FavoritesState {
  const FavoritesLoading();
}

class FavoritesDone extends FavoritesState {
  const FavoritesDone(FavoritesEntity? popular)
      : super(popular: popular);
}

class FavoritesError extends FavoritesState {
  const FavoritesError();
}
