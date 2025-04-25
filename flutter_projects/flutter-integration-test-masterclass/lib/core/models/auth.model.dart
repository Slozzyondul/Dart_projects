class Auth {
  final String? accessToken;
  final String? refreshToken;

  const Auth({
    required this.accessToken,
    required this.refreshToken,
  });

  factory Auth.fromJson(Map<String, dynamic> data) {
    return Auth(
      accessToken: data["access_token"],
      refreshToken: data["refresh_token"],
    );
  }
}
