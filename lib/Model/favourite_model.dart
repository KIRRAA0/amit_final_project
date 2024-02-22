import 'jobs_model.dart';

class Favorite {
  int id;
  int userId;
  int like;
  int jobId;
  String? image;
  String? name;
  String? location;
  String? createdAt;
  String? updatedAt;
  JobModel? job;

  Favorite({
    required this.id,
    required this.userId,
    required this.like,
    required this.jobId,
    this.image,
    this.name,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.job,
  });

  factory Favorite.fromJson(Map<String, dynamic> json) {
    return Favorite(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      like: json['like'] ?? 0,
      jobId: json['job_id'] ?? 0,
      image: json['image'],
      name: json['name'],
      location: json['location'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      job: json['jobs'] != null ? JobModel.fromJson(json['jobs']) : null,
    );
  }
}
