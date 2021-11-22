import 'dart:io';

import 'package:flutter_sandbox/src/features/beers/data/datasource/punk_api.dart';
import 'package:flutter_sandbox/src/features/beers/data/model/remote_beer_response.dart';
import 'package:flutter_sandbox/src/features/beers/domain/model/beer_preview.dart';
import 'package:flutter_sandbox/src/features/beers/domain/repository/beers_repository.dart';
import 'package:flutter_sandbox/src/libraries/core/data_result.dart';

class BeersRepositoryImpl extends IsBeersRepository {
  final PunkApi punkApi;

  BeersRepositoryImpl(this.punkApi);

  Future<DataResult<List<BeerPreview>>> getBeers(
      {required int page, required int perPage}) async {
    try {
      final response = await punkApi.getBeers(page, perPage);

      if (response.response.statusCode == HttpStatus.ok) {
        return DataResult.success(response.data.map(_toDomainEntity).toList());
      } else {
        return DataResult.success(List.empty());
      }
    } on Exception catch (e) {
      return DataResult.failure(e);
    }
  }

  BeerPreview _toDomainEntity(RemoteBeerResponse remoteModel) {
    return BeerPreview(
      id: remoteModel.id,
      name: remoteModel.name,
      tagline: remoteModel.tagline,
      description: remoteModel.description,
      imageUrl: remoteModel.imageUrl,
    );
  }
}
