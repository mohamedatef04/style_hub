import 'package:style_hub/features/auth/domain/entities/login_response_entity.dart';

class LoginResponseModel {
  final String accessToken;
  final String refreshToken;
  final String expiresAtUtc;
  LoginResponseModel({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAtUtc,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      expiresAtUtc: json['expiresAtUtc'],
    );
  }

  LoginResponseEntity toEntity() => LoginResponseEntity(
    accessToken: accessToken,
    refreshToken: refreshToken,
    expiresAtUtc: expiresAtUtc,
  );
}
