class UserData {
  final bool status;
  final UserDataDetails data;
  UserProfile? profile;
  String? token;

  UserData({
    required this.status,
    required this.data,
    this.profile,
    required this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('user')) {
      return UserData.fromNestedJson(json);
    } else {
      return UserData(
        status: json['status'],
        data: UserDataDetails.fromJson(json['data']),
        token: json['token'],
      );
    }
  }

  factory UserData.fromNestedJson(Map<String, dynamic> json) {
    return UserData(
      status: json['status'],
      data: UserDataDetails.fromJson(json['user']),
      token: json['token'],
    );
  }
}


class UserDataDetails {
  final String name;
  final String email;
  int? otp;
  final String updatedAt;
  final String createdAt;
  final int id;

  UserDataDetails({
    required this.name,
    required this.email,
    required this.otp,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory UserDataDetails.fromJson(Map<String, dynamic> json) {
    return UserDataDetails(
      name: json['name'],
      email: json['email'],
      otp: json['otp'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
      id: json['id'],
    );
  }
}

class UserProfile {
  final int userId;
  final String name;
  final String email;
  final String updatedAt;
  final String createdAt;
  final int id;

  UserProfile({
    required this.userId,
    required this.name,
    required this.email,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      userId: json['user_id'],
      name: json['name'],
      email: json['email'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
      id: json['id'],
    );
  }
}
