import 'package:flutter/widgets.dart';
import 'package:style_hub/core/constants/constants.dart';

abstract class AppLangs {
  static Locale getEnglishLang() => const Locale(Constants.enLanguege);
  static Locale getArabicLang() => const Locale(Constants.arLanguege);
}
