import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:morphosis_template/features/tips/data/entities/tip.dart';
import 'package:morphosis_template/features/tips/data/repositories/tip_repo.dart';

part 'tip_details_event.dart';

part 'tip_details_state.dart';

class TipDetailsBloc extends Bloc<TipDetailsEvent, TipDetailsState> {
  final TipRepo tipRepo;

  TipDetailsBloc({required this.tipRepo}) : super(TipDetailsInitial()) {
    on<FetchTipById>((event, emit) async {
      emit(LoadingTipDetails());
      final data = await tipRepo.fetchTipById(tipId: event.tipId);

      data.fold((l) {
        if (l.getTipGeneral != null) {
          emit(TipDetailsLoaded(tip: l.getTipGeneral!));
        }
      }, (r) => emit(FailedLoadingTipDetails(error: r.toString())));
    });
  }
}
