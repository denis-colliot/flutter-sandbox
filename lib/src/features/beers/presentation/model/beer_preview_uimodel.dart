import 'package:equatable/equatable.dart';

class BeerPreviewUiModel extends Equatable {
  final int id;
  final String name;
  final String tagline;
  final String description;
  final String imageUrl;

  const BeerPreviewUiModel({
    required this.id,
    required this.name,
    required this.tagline,
    required this.description,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id, name, tagline, description, imageUrl];

  @override
  bool get stringify => true;
}
