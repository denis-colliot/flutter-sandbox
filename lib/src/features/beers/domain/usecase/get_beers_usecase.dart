import 'package:flutter_sandbox/src/features/beers/domain/model/beer_preview.dart';
import 'package:flutter_sandbox/src/features/beers/domain/repository/beers_repository.dart';
import 'package:flutter_sandbox/src/features/beers/domain/usecase/get_beers_input.dart';
import 'package:flutter_sandbox/src/features/beers/domain/usecase/get_beers_result.dart';
import 'package:flutter_sandbox/src/libraries/core/data_result.dart';
import 'package:flutter_sandbox/src/libraries/core/is_usecase.dart';

class GetBeersUseCase extends IsUseCase<GetBeersUseCaseInput, GetBeersResult> {
  final IsBeersRepository beersRepository;

  GetBeersUseCase(this.beersRepository);

  Future<GetBeersResult> call({required GetBeersUseCaseInput input}) async {
    final dataResult = await beersRepository.getBeers(
        page: input.page, perPage: input.perPage);

    if (dataResult is DataSuccessResult<List<BeerPreview>>) {
      return GetBeersResult.success(dataResult.data);
    } else {
      return GetBeersResult.failure();
    }
  }
}
