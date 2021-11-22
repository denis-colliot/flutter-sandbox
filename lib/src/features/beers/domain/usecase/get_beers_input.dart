import 'package:equatable/equatable.dart';

class GetBeersUseCaseInput extends Equatable {
  final int page;
  final int perPage;

  GetBeersUseCaseInput({required this.page, required this.perPage});

  @override
  List<Object?> get props => [page, perPage];
}
