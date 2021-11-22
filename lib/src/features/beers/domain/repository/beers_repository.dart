import 'package:flutter_sandbox/src/features/beers/domain/model/beer_preview.dart';
import 'package:flutter_sandbox/src/libraries/core/data_result.dart';

abstract class IsBeersRepository {
  Future<DataResult<List<BeerPreview>>> getBeers(
      {required int page, required int perPage});
}
