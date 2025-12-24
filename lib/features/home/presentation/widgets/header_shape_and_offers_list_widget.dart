import 'package:flutter/material.dart';
import 'package:style_hub/features/home/presentation/widgets/home_header_shape_widget.dart';
import 'package:style_hub/features/home/presentation/widgets/offers_list.dart';

class HeaderShapeAndOffersListWidget extends StatelessWidget {
  const HeaderShapeAndOffersListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.25 + screenHeight * 0.09,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const HomeHeaderShapeWidget(),
          Positioned(
            top: screenHeight * 0.16,
            left: 0,
            right: 0,
            child: SizedBox(
              height: screenHeight * 0.18,
              child: const OffersList(),
            ),
          ),
        ],
      ),
    );
  }
}
