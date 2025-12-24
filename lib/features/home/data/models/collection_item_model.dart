import 'package:equatable/equatable.dart';
import 'package:style_hub/features/home/domain/entities/collection_item_entity.dart';

class CollectionItemModel extends Equatable {
  final String id;

  final String productCode;

  final String name;

  final String description;

  final String arabicName;

  final String arabicDescription;

  final String coverPictureUrl;

  final List<String>? productPictures;

  final double price;
  final int stock;

  final double weight;

  final String color;

  final double rating;
  final int reviewsCount;
  final double discountPercentage;
  final String sellerId;
  final List<String> categories;

  const CollectionItemModel({
    required this.id,
    required this.productCode,
    required this.name,
    required this.description,
    required this.arabicName,
    required this.arabicDescription,
    required this.coverPictureUrl,
    required this.productPictures,
    required this.price,
    required this.stock,
    required this.weight,
    required this.color,
    required this.rating,
    required this.reviewsCount,
    required this.discountPercentage,
    required this.sellerId,
    required this.categories,
  });

  factory CollectionItemModel.fromJson(Map<String, dynamic> json) {
    return CollectionItemModel(
      id: json['id'] ?? '',
      productCode: json['productCode'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      arabicName: json['arabicName'] ?? '',
      arabicDescription: json['arabicDescription'] ?? '',
      coverPictureUrl: json['coverPictureUrl'] ?? '',
      productPictures: json['productPictures'] != null
          ? List<String>.from(json['productPictures'])
          : null,
      price: (json['price'] ?? 0).toDouble(),
      stock: json['stock'] ?? 0,
      weight: (json['weight'] ?? 0).toDouble(),
      color: json['color'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      reviewsCount: json['reviewsCount'] ?? 0,
      discountPercentage: (json['discountPercentage'] ?? 0).toDouble(),
      sellerId: json['sellerId'] ?? '',
      categories: json['categories'] != null
          ? List<String>.from(json['categories'])
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "productCode": productCode,
      "name": name,
      "description": description,
      "arabicName": arabicName,
      "arabicDescription": arabicDescription,
      "coverPictureUrl": coverPictureUrl,
      "productPictures": productPictures,
      "price": price,
      "stock": stock,
      "weight": weight,
      "color": color,
      "rating": rating,
      "reviewsCount": reviewsCount,
      "discountPercentage": discountPercentage,
      "sellerId": sellerId,
      "categories": categories,
    };
  }

  CollectionItemEntity toEntity() => CollectionItemEntity(
    id: id,
    productCode: productCode,
    name: name,
    description: description,
    arabicName: arabicName,
    arabicDescription: arabicDescription,
    coverPictureUrl: coverPictureUrl,
    productPictures: productPictures,
    price: price,
    stock: stock,
    weight: weight,
    color: color,
    rating: rating,
    reviewsCount: reviewsCount,
    discountPercentage: discountPercentage,
    sellerId: sellerId,
    categories: categories,
  );

  @override
  List<Object?> get props => [
    id,
    productCode,
    name,
    description,
    arabicName,
    arabicDescription,
    coverPictureUrl,
    productPictures,
    price,
    stock,
    weight,
    color,
    rating,
    reviewsCount,
    discountPercentage,
    sellerId,
    categories,
  ];
}
