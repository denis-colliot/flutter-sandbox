class RemoteBeerResponse {
  final int id;
  final String name;
  final String tagline;
  final String description;
  final String imageUrl;

  const RemoteBeerResponse({
    required this.id,
    required this.name,
    required this.tagline,
    required this.description,
    required this.imageUrl,
  });

  factory RemoteBeerResponse.fromJson(Map<String, dynamic> map) {
    return RemoteBeerResponse(
      id: map['id'] as int,
      name: map['name'] as String,
      tagline: map['tagline'] as String,
      description: map['description'] as String,
      imageUrl: map['image_url'] as String,
    );
  }
}
