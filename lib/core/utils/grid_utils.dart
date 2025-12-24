import 'package:flutter/material.dart';

/// Utility class for calculating responsive grid dimensions
class GridUtils {
  /// Calculate the optimal child aspect ratio for product grids
  /// based on the screen width
  ///
  /// This ensures consistent sizing across different screen sizes
  static double calculateProductGridAspectRatio(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    // For very small screens (< 360px)
    if (screenWidth < 360) {
      return 0.70;
    }
    // For small screens (360-400px)
    else if (screenWidth < 400) {
      return 0.72;
    }
    // For medium screens (400-600px) - most phones
    else if (screenWidth < 600) {
      return 0.75;
    }
    // For large screens (600-800px) - tablets in portrait
    else if (screenWidth < 800) {
      return 0.80;
    }
    // For extra large screens (>800px) - tablets in landscape
    else {
      return 0.85;
    }
  }

  /// Calculate the number of columns based on screen width
  static int calculateCrossAxisCount(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    // For very large screens, use 3 columns
    if (screenWidth > 800) {
      return 3;
    }
    // Default to 2 columns for most devices
    return 2;
  }
}
