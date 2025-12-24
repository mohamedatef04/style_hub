class RegisterRequestEntity {
  final String userFirstName;
  final String userLastName;
  final String userEmail;
  final String userPassword;

  RegisterRequestEntity({
    required this.userFirstName,
    required this.userLastName,
    required this.userEmail,
    required this.userPassword,
  });
}
