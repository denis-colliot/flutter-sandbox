/// Interface representing a feature use case.
///  - [Input]: Type of the use case input argument (may be [void]).
///  - [Result]: Type of the use case output result.
abstract class IsUseCase<Input, Result> {
  /// Executes the use case and returns asynchronous result.
  Future<Result> call({required Input input});
}
