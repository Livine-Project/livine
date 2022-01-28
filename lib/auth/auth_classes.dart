class LoginResponse {
  String? token;

  LoginResponse(
      {this.token,}
      );

  LoginResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'] as String;
  }
}
