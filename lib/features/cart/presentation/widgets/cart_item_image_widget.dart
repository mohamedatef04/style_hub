import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/features/cart/domain/entities/cart_item_entity.dart';

class CartItemImageWidget extends StatelessWidget {
  const CartItemImageWidget({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: cartItemEntity.productCoverUrl,
      imageBuilder: (context, imageProvider) => Container(
        height: 80.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
          ),
        ),
      ),
      placeholder: (context, url) =>
          const Center(child: CupertinoActivityIndicator()),
      errorWidget: (context, url, error) =>
          const Center(child: Icon(Icons.error)),
    );
  }
}
