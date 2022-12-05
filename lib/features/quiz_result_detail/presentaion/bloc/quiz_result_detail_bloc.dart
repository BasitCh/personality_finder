import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morphosis_template/core/global/error/network_exceptions.dart';
import 'package:morphosis_template/features/quiz_result_detail/domain/enties/quiz_result_data.dart';
import 'package:morphosis_template/features/quiz_result_detail/domain/repositories/quiz_result_details_repo.dart';
part 'quiz_result_detail_event.dart';
part 'quiz_result_detail_state.dart';

class QuizResultDetailBloc extends Bloc<QuizResultDetailEvent, QuizResultDetailState> {
  final QuizResultDetailRepo quizResultDetailRepo;
  QuizResultDetailBloc({required this.quizResultDetailRepo}) : super(QuizResultDetailInitial()) {
    on<QuizResultDetailFetch>((event, emit) async {
      emit( QuizResultDetailInitial());
      final data = await quizResultDetailRepo.quizResultDetail(event.quizResultContentId);
       
      data.fold((l) {
          
          emit(QuizResultDetailSuccess(quizResultData: l));
      
      }, (r) => emit(QuizResultDetailFailure(NetworkExceptions.getErrorMessage(r))));
    });
  }
}
