// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:morphosis_template/core/global/util/preferences/preferences_storage.dart';
import 'package:morphosis_template/di/injectable.dart';

import 'package:morphosis_template/features/quiz_tasking/data/model/quiz_answers.dart';

part 'save_event.dart';
part 'save_state.dart';

class SaveAnswerBloc extends Bloc<SaveAnswerEvent, SaveAnswerState> {
  SaveAnswerBloc() : super(SaveAnswerInitialize()) {
    on<SaveAnswerData>((event, emit) async {
      emit(SaveAnswerInitialize());
      final saveAnswer = event.saveAnswerData;
      var myData = '[';
      saveAnswer.forEach((element) {
        myData +=
            '{questionId:${element.questionId},answerId:${element.answerId}}';
      });
      myData += ']';
      await getIt<SharedPreferenceStorage>()
          .saveString(key: 'answer', value: myData);
      
      emit(SavedSuccess(saveAnswerData: myData));
    });
  }
}
