class UserLoginRequest {
  String? email;
  String? password;

  UserLoginRequest({this.email, this.password});

  Map toJson() => {"email": email, "password": password};
}

class UserRegisterRequest {
  String? name;
  String? email;
  String? password;
  String? passwordConfirmation;

  UserRegisterRequest(
      {this.name, this.email, this.password, this.passwordConfirmation});

  Map toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation
      };
}
