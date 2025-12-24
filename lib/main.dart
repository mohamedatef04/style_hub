import 'package:flutter/material.dart';
import 'package:style_hub/core/constants/constants.dart';
import 'package:style_hub/core/services/get_it_service.dart';
import 'package:style_hub/core/services/shared_prefrences_service.dart';
import 'package:style_hub/style_hub.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await SharedPrefrenceService.init();
  initGetIt();
  final currentLanguageCode =
      await SharedPrefrenceService.getString(
            Constants.keyLangugeCode,
          )
          as String? ??
      Constants.enLanguege;
  final initialLocal = currentLanguageCode == Constants.enLanguege
      ? const Locale(Constants.enLanguege)
      : const Locale(Constants.arLanguege);

  runApp(
    StyleHub(
      initialLocal: initialLocal,
    ),
  );
}
