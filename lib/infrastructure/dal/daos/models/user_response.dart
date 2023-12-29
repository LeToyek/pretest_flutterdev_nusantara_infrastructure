class UserModelDaos {
  String? id;
  String? name;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  UserModelDaos(
      {this.id,
      this.name,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt});

  factory UserModelDaos.fromJson(Map<String, dynamic> json) {
    return UserModelDaos(
      id: json['id'],
      name: json['name'],
      emailVerifiedAt: json['email_verified_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class UserRegisterResponse {
  String? message;
  UserModelDaos? user;

  UserRegisterResponse({this.message, this.user});

  factory UserRegisterResponse.fromJson(Map<String, dynamic> json) {
    return UserRegisterResponse(
      message: json['message'],
      user: UserModelDaos.fromJson(json['user']),
    );
  }
}

class UserLoginResponse {
  String? message;
  String? token;

  UserLoginResponse({this.message, this.token});

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) {
    return UserLoginResponse(
      message: json['message'],
      token: json['token'],
    );
  }
}
