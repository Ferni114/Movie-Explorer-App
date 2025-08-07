import 'package:equatable/equatable.dart';
import '../../domain/entities/searches_entity.dart';

abstract class SearchesState extends Equatable {
  final SearchesEntity? popular;

  const SearchesState({this.popular});

  @override
  List<Object> get props => [popular!];
}

class SearchesLoading extends SearchesState {
  const SearchesLoading();
}

class SearchesDone extends SearchesState {
  const SearchesDone(SearchesEntity? popular)
      : super(popular: popular);
}

class SearchesError extends SearchesState {
  const SearchesError();
}
