import 'package:equatable/equatable.dart';
import '../../domain/entities/movie_detail_entity.dart';

abstract class MovieDetailState extends Equatable {
  final MovieDetailEntity? popular;

  const MovieDetailState({this.popular});

  @override
  List<Object> get props => [popular!];
}

class MovieDetailLoading extends MovieDetailState {
  const MovieDetailLoading();
}

class MovieDetailDone extends MovieDetailState {
  const MovieDetailDone(MovieDetailEntity? popular)
      : super(popular: popular);
}

class MovieDetailError extends MovieDetailState {
  const MovieDetailError();
}
