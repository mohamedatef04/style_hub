import 'package:equatable/equatable.dart';
import 'package:style_hub/features/home/domain/entities/offer_entity.dart';

class OfferModel extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final String? image;
  final String? createdAt;

  const OfferModel({
    this.id,
    this.name,
    this.description,
    this.image,
    this.createdAt,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['coverUrl'],
      createdAt: json['createdAt'],
    );
  }

  OfferEntity toEntity() => OfferEntity(
    id: id ?? '',
    name: name ?? '',
    description: description ?? '',
    image: image ?? '',
    createdAt: createdAt ?? '',
  );

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    image,
    createdAt,
  ];
}
