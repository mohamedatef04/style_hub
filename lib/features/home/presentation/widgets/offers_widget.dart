import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_hub/features/home/domain/entities/offer_entity.dart';

class OffersWidget extends StatelessWidget {
  const OffersWidget({super.key, required this.offerEntity});
  final OfferEntity offerEntity;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: offerEntity.image,
      imageBuilder: (context, imageProvider) => Container(
        width: MediaQuery.sizeOf(context).width * 0.8,
        height: 180.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: Colors.grey.shade300, width: 1.5),
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
