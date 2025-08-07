import 'package:equatable/equatable.dart';
import '../../domain/entities/populars_entity.dart';

abstract class PopularsState extends Equatable {
  final PopularsEntity? popular;

  const PopularsState({this.popular});

  @override
  List<Object> get props => [popular!];
}

class PopularsLoading extends PopularsState {
  const PopularsLoading();
}

class PopularsDone extends PopularsState {
  const PopularsDone(PopularsEntity? popular)
      : super(popular: popular);
}

class PopularsError extends PopularsState {
  const PopularsError();
}
