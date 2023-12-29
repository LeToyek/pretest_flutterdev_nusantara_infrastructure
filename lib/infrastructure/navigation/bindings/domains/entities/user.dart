import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/dal/daos/models/user_response.dart';

class User {
  int? id;
  String? name;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt});

  factory User.fromData(UserModelDaos data) {
    return User(
      id: data.id,
      name: data.name,
      emailVerifiedAt: data.emailVerifiedAt,
      createdAt: data.createdAt,
      updatedAt: data.updatedAt,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      emailVerifiedAt: json['email_verified_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email_verified_at': emailVerifiedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class UserCredential {
  String? email;
  String? password;

  UserCredential({this.email, this.password});
}

class UserRegisterCredential {
  String? name;
  String? email;
  String? password;
  String? passwordConfirmation;

  UserRegisterCredential(
      {this.name, this.email, this.password, this.passwordConfirmation});
}
