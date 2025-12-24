import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:style_hub/features/home/domain/entities/collection_item_entity.dart';

class ItemDetailsImageWidget extends StatelessWidget {
  const ItemDetailsImageWidget({
    super.key,
    required this.collectionItemEntity,
  });
  final CollectionItemEntity collectionItemEntity;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: collectionItemEntity.coverPictureUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
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
