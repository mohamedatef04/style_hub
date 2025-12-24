import 'package:style_hub/features/home/domain/entities/user_entity.dart';

class UserModel {
  final String? id;
  final String? fullName;
  final String? email;
  final String? imageUrl;

  UserModel({
    this.id,
    this.fullName,
    this.email,
    this.imageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['userId'],
      fullName: json['fullName'],
      email: json['email'],
      imageUrl: json['profilePicture'],
    );
  }

  UserEntity toEntity() => UserEntity(
    id: id ?? '',
    name: fullName ?? '',
    email: email ?? '',
    image: imageUrl ?? '',
  );
}
