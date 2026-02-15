class College {
  final String id;
  final String name;
  final String location;
  final String imageUrl;
  final double rating;
  final List<String> courses;
  final String description;

  College({
    required this.id,
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.rating,
    required this.courses,
    required this.description,
  });
}
