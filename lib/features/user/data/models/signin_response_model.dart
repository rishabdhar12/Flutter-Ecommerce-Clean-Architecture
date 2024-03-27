class SignInResponseModel {
  final String accessToken;
  final String refreshToken;

  const SignInResponseModel({
    required this.accessToken,
    required this.refreshToken,
  });

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) =>
      SignInResponseModel(
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "refresh_token": refreshToken,
      };
}
