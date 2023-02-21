class LoginResponse {
  bool? success;
  String? token;

  LoginResponse({
    this.success,
    this.token,
  });
  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        success: json["successes"],
        token: json["token"],
      );
  Map<String, dynamic> toJson() => {
        "successes": success,
        "token": token,
      };
}
