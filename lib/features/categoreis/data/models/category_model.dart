import 'package:equatable/equatable.dart';
import 'package:style_hub/features/categoreis/domain/entities/category_entity.dart';

class CategoryModel extends Equatable {
  final String id;
  final String? name;
  final String? image;
  final String? description;

  const CategoryModel({
    required this.id,
    this.name,
    this.image,
    this.description,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json['id'] as String,
    name: json['name'] as String?,
    image: json['coverPictureUrl'] as String?,
    description: json['description'] as String?,
  );

  CategoryEntity toEntity() => CategoryEntity(
    id: id,
    name: name ?? '',
    image: image ?? '',
    description: description ?? '',
  );

  @override
  List<Object?> get props => [id, name, image, description];
}
