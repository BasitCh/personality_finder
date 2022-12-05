// Flutter imports:
// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// Project imports:
import '../../../di/injectable.dart';
import '../util/preferences/preferences_storage.dart';
import 'entities/language.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc()
      : super(LanguageLoaded(locale: Locale(Languages.languages[0].code))) {
    on<GetLanguageEvent>((event, emit) {
      final sp = getIt<SharedPreferenceStorage>();

      final locale = sp.getLocale() ?? Languages.languages[0].code;

      emit(LanguageLoaded(locale: Locale(locale)));
    });
    on<ToggleLanguageEvent>((event, emit) {
      getIt<SharedPreferenceStorage>().saveLocale(code: event.language.code);

      emit(LanguageLoaded(locale: Locale(event.language.code)));
    });
  }
}
