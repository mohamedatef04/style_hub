import 'package:style_hub/features/cart/domain/entities/cart_item_entity.dart';

class CartItemModel {
  final String? itemId;
  final String? productId;
  final String? productName;
  final String? productCoverUrl;
  final int? productStock;
  final double? weightInGrams;
  final int? quantity;
  final String? color;
  final double? discountPercentage;
  final double? basePricePerUnit;
  final double? finalPricePerUnit;
  final double? totalPrice;

  CartItemModel({
    this.itemId,
    this.productId,
    this.productName,
    this.productCoverUrl,
    this.productStock,
    this.weightInGrams,
    this.quantity,
    this.color,
    this.discountPercentage,
    this.basePricePerUnit,
    this.finalPricePerUnit,
    this.totalPrice,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      itemId: json["itemId"] as String?,
      productId: json["productId"] as String?,
      productName: json["productName"] as String?,
      productCoverUrl: json["productCoverUrl"] as String?,
      productStock: json["productStock"] as int?,
      weightInGrams: (json["weightInGrams"] as num?)?.toDouble(),
      quantity: json["quantity"] as int?,
      color: json["color"] as String?,
      discountPercentage: (json["discountPercentage"] as num?)?.toDouble(),
      basePricePerUnit: (json["basePricePerUnit"] as num?)?.toDouble(),
      finalPricePerUnit: (json["finalPricePerUnit"] as num?)?.toDouble(),
      totalPrice: (json["totalPrice"] as num?)?.toDouble(),
    );
  }

  CartItemEntity toEntity() {
    return CartItemEntity(
      itemId: itemId ?? '',
      productId: productId ?? '',
      productName: productName ?? '',
      productCoverUrl: productCoverUrl ?? '',
      productStock: productStock ?? 0,
      weightInGrams: weightInGrams ?? 0.0,
      quantity: quantity ?? 0,
      color: color ?? '',
      discountPercentage: discountPercentage ?? 0.0,
      basePricePerUnit: basePricePerUnit ?? 0.0,
      finalPricePerUnit: finalPricePerUnit ?? 0.0,
      totalPrice: totalPrice ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "itemId": itemId,
      "productId": productId,
      "productName": productName,
      "productCoverUrl": productCoverUrl,
      "productStock": productStock,
      "weightInGrams": weightInGrams,
      "quantity": quantity,
      "discountPercentage": discountPercentage,
      "basePricePerUnit": basePricePerUnit,
      "finalPricePerUnit": finalPricePerUnit,
      "totalPrice": totalPrice,
    };
  }
}
