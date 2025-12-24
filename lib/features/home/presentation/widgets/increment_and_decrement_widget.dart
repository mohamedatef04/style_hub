import 'package:flutter/material.dart';
import 'package:style_hub/core/widgets/quantity_selector_widget.dart';

class IncrementAndDecrementWidget extends StatelessWidget {
  const IncrementAndDecrementWidget({
    super.key,
    required this.quantityNotifier,
    this.initialQuantity = 1,
    this.minQuantity = 1,
    this.maxQuantity,
  });

  final ValueNotifier<int> quantityNotifier;

  final int initialQuantity;

  final int minQuantity;

  final int? maxQuantity;

  @override
  Widget build(BuildContext context) {
    return QuantitySelectorWidget(
      initialQuantity: initialQuantity,
      minQuantity: minQuantity,
      maxQuantity: maxQuantity,
      onQuantityChanged: (newQuantity) {
        quantityNotifier.value = newQuantity;
      },
    );
  }
}
