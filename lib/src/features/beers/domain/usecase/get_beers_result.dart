import 'package:equatable/equatable.dart';
import 'package:flutter_sandbox/src/features/beers/domain/model/beer_preview.dart';

abstract class GetBeersResult extends Equatable {
  GetBeersResult._();

  factory GetBeersResult.success(List<BeerPreview> data) =
      GetBeersSuccessResult;

  factory GetBeersResult.failure() = GetBeersFailureResult;
}

class GetBeersSuccessResult extends GetBeersResult {
  GetBeersSuccessResult(this.beers) : super._();

  final List<BeerPreview> beers;

  @override
  List<Object?> get props => [beers];
}

class GetBeersFailureResult extends GetBeersResult {
  GetBeersFailureResult() : super._();

  @override
  List<Object?> get props => [];
}
