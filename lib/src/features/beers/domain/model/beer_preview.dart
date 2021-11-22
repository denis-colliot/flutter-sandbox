import 'package:equatable/equatable.dart';

class BeerPreview extends Equatable {
  final int id;
  final String name;
  final String tagline;
  final String description;
  final String imageUrl;

  const BeerPreview({
    required this.id,
    required this.name,
    required this.tagline,
    required this.description,
    required this.imageUrl,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      tagline,
      description,
      imageUrl,
    ];
  }

  @override
  bool get stringify => true;
}
