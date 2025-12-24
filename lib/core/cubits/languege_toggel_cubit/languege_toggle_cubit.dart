import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/core/constants/constants.dart';
import 'package:style_hub/core/services/shared_prefrences_service.dart';

class LanguegeToggleCubit extends Cubit<Locale> {
  final Locale initialLocal;
  LanguegeToggleCubit(this.initialLocal) : super(initialLocal);

  void toggleLanguege(Locale locale) {
    emit(locale);
    cachLanguegeCode(languegeCode: locale.languageCode);
  }

  void cachLanguegeCode({required String languegeCode}) async {
    await SharedPrefrenceService.setString(
      Constants.keyLangugeCode,
      languegeCode,
    );
  }
}
