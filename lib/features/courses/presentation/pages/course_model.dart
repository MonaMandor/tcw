class CourseModel {
  final String title;
  final String imageUrl;
  final String coachName;
  final String coachRole;
  final double price;
  final int lessons;
  final String duration;
  final int available;
  final String coachImageUrl;

  CourseModel({
    required this.title,
    required this.imageUrl,
    required this.coachName,
    required this.coachRole,
    required this.price,
    required this.lessons,
    required this.duration,
    required this.available,
    required this.coachImageUrl,
  });
}
