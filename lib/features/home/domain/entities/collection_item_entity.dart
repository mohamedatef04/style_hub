class CollectionItemEntity {
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

  const CollectionItemEntity({
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
}
