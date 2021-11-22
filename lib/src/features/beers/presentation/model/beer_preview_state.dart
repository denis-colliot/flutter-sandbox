import 'package:flutter_sandbox/src/features/beers/presentation/model/beer_preview_uimodel.dart';

class BeerPreviewsState {
  BeerPreviewsState._();

  factory BeerPreviewsState.success(List<BeerPreviewUiModel> data) =
      BeerPreviewsSuccessState;

  factory BeerPreviewsState.failure() = BeerPreviewsErrorState;
}

class BeerPreviewsSuccessState extends BeerPreviewsState {
  BeerPreviewsSuccessState(this.beerPreviews) : super._();

  final List<BeerPreviewUiModel> beerPreviews;
}

class BeerPreviewsErrorState extends BeerPreviewsState {
  BeerPreviewsErrorState() : super._();
}
