class LoginResponseEntity {
  final String accessToken;
  final String refreshToken;
  final String expiresAtUtc;

  LoginResponseEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAtUtc,
  });
}
