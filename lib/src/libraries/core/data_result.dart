import 'package:equatable/equatable.dart';

abstract class DataResult<T> extends Equatable {
  DataResult._();

  factory DataResult.success(T data) = DataSuccessResult;

  factory DataResult.failure(Exception error) = DataFailureResult;
}

class DataSuccessResult<T> extends DataResult<T> {
  DataSuccessResult(this.data) : super._();

  final T data;

  @override
  List<Object?> get props => [data];
}

class DataFailureResult<T> extends DataResult<T> {
  DataFailureResult(this.error) : super._();

  final Exception error;

  @override
  List<Object?> get props => [error];
}
