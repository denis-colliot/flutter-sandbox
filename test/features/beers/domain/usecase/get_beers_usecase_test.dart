import 'dart:async';

import 'package:flutter_sandbox/src/features/beers/domain/repository/beers_repository.dart';
import 'package:flutter_sandbox/src/features/beers/domain/usecase/get_beers_input.dart';
import 'package:flutter_sandbox/src/features/beers/domain/usecase/get_beers_result.dart';
import 'package:flutter_sandbox/src/features/beers/domain/usecase/get_beers_usecase.dart';
import 'package:flutter_sandbox/src/libraries/core/data_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_beers_usecase_test.mocks.dart';

@GenerateMocks([IsBeersRepository])
void main() {
  group('Get beers use case should', () {
    test('return failure result when repository fails', () async {
      // Given
      final mockBeersRepository = MockIsBeersRepository();
      when(mockBeersRepository.getBeers(
              page: anyNamed('page'), perPage: anyNamed('perPage')))
          .thenAnswer(
              (_) async => DataResult.failure(TimeoutException("Unused")));
      final useCase = GetBeersUseCase(mockBeersRepository);
      final input = GetBeersUseCaseInput(page: 2, perPage: 42);

      // When
      final result = useCase.call(input: input);

      // Then
      verify(mockBeersRepository.getBeers(page: 2, perPage: 42)).called(1);
      expect(await result, isA<GetBeersFailureResult>());
    });

    test(
        'return success result when repository successfully returns empty list',
        () async {
      // Given
      final mockBeersRepository = MockIsBeersRepository();
      when(mockBeersRepository.getBeers(
              page: anyNamed('page'), perPage: anyNamed('perPage')))
          .thenAnswer((_) async => DataResult.success(List.empty()));
      final useCase = GetBeersUseCase(mockBeersRepository);
      final input = GetBeersUseCaseInput(page: 3, perPage: 42);

      // When
      final result = useCase.call(input: input);

      // Then
      verify(mockBeersRepository.getBeers(page: 3, perPage: 42)).called(1);
      expect(await result, GetBeersSuccessResult(List.empty()));
    });
  });
}
