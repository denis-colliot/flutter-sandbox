library feature.beers;

import 'dart:async';

import 'package:flutter_sandbox/src/features/beers/domain/model/beer_preview.dart';
import 'package:flutter_sandbox/src/features/beers/domain/usecase/get_beers_input.dart';
import 'package:flutter_sandbox/src/features/beers/domain/usecase/get_beers_result.dart';
import 'package:flutter_sandbox/src/features/beers/domain/usecase/get_beers_usecase.dart';
import 'package:flutter_sandbox/src/features/beers/presentation/model/beer_preview_state.dart';
import 'package:flutter_sandbox/src/features/beers/presentation/model/beer_preview_uimodel.dart';

class BeersViewModel {
  final GetBeersUseCase _getBeersUseCase;

  final _beersController = StreamController<BeerPreviewsState>.broadcast();

  Stream<BeerPreviewsState> get beers => _beersController.stream;

  BeersViewModel(this._getBeersUseCase);

  loadBeers() async {
    final input = GetBeersUseCaseInput(page: 1, perPage: 30);
    final result = await _getBeersUseCase.call(input: input);

    if (result is GetBeersSuccessResult) {
      _beersController.sink.add(result.toState());
    } else {
      _beersController.addError("Beers loading error");
    }
  }

  onSelectBeer(BeerPreviewUiModel selectedBeer) {
    print(selectedBeer);
    // TODO Navigate to beer details screen
  }

  dispose() {
    _beersController.close();
  }
}

extension _GetBeersResultExt on GetBeersResult {
  BeerPreviewsState toState() {
    if (this is GetBeersSuccessResult) {
      final uiModels =
          (this as GetBeersSuccessResult).beers.map(_toUiModel).toList();
      return BeerPreviewsState.success(uiModels);
    } else {
      return BeerPreviewsState.failure();
    }
  }

  BeerPreviewUiModel _toUiModel(BeerPreview beerPreview) {
    return BeerPreviewUiModel(
      id: beerPreview.id,
      name: beerPreview.name,
      tagline: beerPreview.tagline,
      description: beerPreview.description,
      imageUrl: beerPreview.imageUrl,
    );
  }
}
