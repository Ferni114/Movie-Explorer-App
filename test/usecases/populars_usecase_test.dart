import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../lib/features/populars/domain/usecases/populars_usecase.dart';
import '../../lib/features/populars/domain/entities/populars_entity.dart';
import '../../lib/features/populars/domain/entities/popular_entity.dart';
import '../../lib/core/resources/data_state.dart';

import '../mocks/mocks.mocks.dart';

void main() {
  late MockPopularsRepository mockRepository;
  late GetPopularsUseCase useCase;

  setUp(() {
    mockRepository = MockPopularsRepository();
    useCase = GetPopularsUseCase(mockRepository);
  });

  test('debe retornar DataSuccess<PopularsEntity> al llamar al repositorio con éxito', () async {
  
    const page = 1;
    final expectedEntity = PopularsEntity(
      page: page,
      results: [
        PopularEntity(
          id: 1,
          poster: 'poster1.jpg',
          title: 'Película 1',
          date: '2025-08-06',
          ranking: '8.5',
        ),
      ],
      pages: 10,
      total: 100,
    );

    when(mockRepository.getPopulars(page)).thenAnswer(
      (_) async => DataSuccess(expectedEntity),
    );

  
    final result = await useCase.call(params: page);

    expect(result, isA<DataSuccess<PopularsEntity>>());
    expect(result.data, equals(expectedEntity));
    verify(mockRepository.getPopulars(page)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
