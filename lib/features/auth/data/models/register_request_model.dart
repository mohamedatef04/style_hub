import 'package:style_hub/features/auth/domain/entities/register_request_entity.dart';

class RegisterRequestModel {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  RegisterRequestModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'password': password,
  };
  factory RegisterRequestModel.fromEntity(RegisterRequestEntity entity) {
    return RegisterRequestModel(
      firstName: entity.userFirstName,
      lastName: entity.userLastName,
      email: entity.userEmail,
      password: entity.userPassword,
    );
  }
}
