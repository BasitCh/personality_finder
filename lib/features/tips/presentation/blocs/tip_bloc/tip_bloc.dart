import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:morphosis_template/features/tips/data/entities/tip.dart';
import 'package:morphosis_template/features/tips/data/repositories/tip_repo.dart';
import 'package:stream_transform/stream_transform.dart';

part 'tip_event.dart';

part 'tip_state.dart';

const throttleDuration = Duration(milliseconds: 1000);
const perPage = 10;

class TipBloc extends Bloc<TipEvent, TipState> {
  final TipRepo tipRepo;
  int page = 1;

  TipBloc({required this.tipRepo}) : super(TipInitial()) {
    //Debounce query requests
    EventTransformer<E> debounce<E>(Duration duration) {
      return (events, mapper) {
        return events.debounce(duration).switchMap(mapper);
      };
    }

    on<InitialEvent>((event, emit) => emit(TipInitial()));
    on<GetTips>(_onGetTips, transformer: debounce(throttleDuration));
  }

  Future<void> _onGetTips(GetTips event, Emitter<TipState> emit) async {
    if (state is TipInitial || state is LoadingTips) {
      emit(LoadingTips());
      final data = await tipRepo.fetchTips(page: page, perPage: perPage);

      data.fold((l) {
        if (l.getMyTips != null &&
            l.getMyTips!.tips != null &&
            l.getMyTips!.tips!.isNotEmpty) {
          emit(TipsLoaded(
              tips: l.getMyTips!.tips!,
              hasReachedMax: l.getMyTips!.tips!.length < perPage));
        } else {
          emit(const FailedLoadingTips(error: 'No Tip found'));
        }
      }, (r) => emit(FailedLoadingTips(error: r.toString())));
    }
    if (state is TipsLoaded && !(state as TipsLoaded).hasReachedMax) {
      final tipsListLoadedState = state as TipsLoaded;
      page += 1;
      final response = await tipRepo.fetchTips(page: page, perPage: perPage);

      response.fold((l) {
        if (l.getMyTips != null &&
            l.getMyTips!.tips != null &&
            l.getMyTips!.tips!.isNotEmpty) {
          final newTips = List.of(tipsListLoadedState.tips)
            ..addAll(l.getMyTips!.tips!);
          emit(TipsLoaded(
              tips: newTips,
              hasReachedMax:
                  !(newTips.length < l.getMyTips!.paginationInfo!.count!)));
        } else {
          emit(tipsListLoadedState.copyWith(hasReachedMax: true));
        }
      }, (r) => emit(FailedLoadingTips(error: r.toString())));
    }
  }
}
