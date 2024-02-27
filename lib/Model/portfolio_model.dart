class Portfolio {
  int id;
  String cvFile;
  String name;
  String? image;
  int userId;
  String createdAt;
  String updatedAt;

  Portfolio({
    required this.id,
    required this.cvFile,
    required this.name,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    this.image,
  });

  factory Portfolio.fromJson(Map<String, dynamic> json) {
    return Portfolio(
      id: json['id'] ?? 0,
      cvFile: json['cv_file'] ?? '',
      name: json['name'] ?? '',
      userId: json['user_id'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      image: json['image'],
    );
  }
}

class Profile {
  int id;
  int userId;
  String name;
  String email;
  String? mobile;
  String? address;
  String? language;
  String? interestedWork;
  String? offlinePlace;
  String? remotePlace;
  String? bio;
  String? education;
  String? experience;
  String? personalDetailed;
  String createdAt;
  String updatedAt;

  Profile({
    required this.id,
    required this.userId,
    required this.name,
    required this.email,
    this.mobile,
    this.address,
    this.language,
    this.interestedWork,
    this.offlinePlace,
    this.remotePlace,
    this.bio,
    this.education,
    this.experience,
    this.personalDetailed,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      mobile: json['mobile'],
      address: json['address'],
      language: json['language'],
      interestedWork: json['interested_work'],
      offlinePlace: json['offline_place'],
      remotePlace: json['remote_place'],
      bio: json['bio'],
      education: json['education'],
      experience: json['experience'],
      personalDetailed: json['personal_detailed'],
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}

class UserData {
  List<Portfolio> portfolio;
  Profile profile;

  UserData({
    required this.portfolio,
    required this.profile,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    List<Portfolio> portfolio = [];
    if (json['portfolio'] != null) {
      json['portfolio'].forEach((item) {
        portfolio.add(Portfolio.fromJson(item));
      });
    }

    return UserData(
      portfolio: portfolio,
      profile: Profile.fromJson(json['profile']),
    );
  }
}
