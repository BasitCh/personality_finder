import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:morphosis_template/core/global/extensions/context_extensions.dart';
import 'package:morphosis_template/core/global/extensions/number_extensions.dart';
import 'package:morphosis_template/core/global/navigator/app_router.gr.dart';
import 'package:morphosis_template/di/injectable.dart';
import 'package:morphosis_template/features/app/presentation/widgets/standard_text.dart';
import 'package:morphosis_template/features/tips/presentation/blocs/tip_bloc/tip_bloc.dart';
import 'package:morphosis_template/features/tips/presentation/widgets/tip_loading_shimmer.dart';
import 'package:morphosis_template/features/tips/presentation/widgets/tips_item_widget.dart';

class TipsView extends StatefulWidget {
  final ScrollController scrollController;

  const TipsView({required this.scrollController});

  @override
  _TipsViewState createState() => _TipsViewState();
}

class _TipsViewState extends State<TipsView> {
  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    getIt<TipBloc>().page = 1;
    getIt<TipBloc>().add(GetTips());
    return BlocConsumer(
        bloc: getIt<TipBloc>(),
        listener: (context, state) {
          if (state is TipsLoaded) {}
        },
        builder: (context, state) {
          return state is LoadingTips || state is TipInitial
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, state) {
                    return TipLoadingShimmer();
                  })
              : (state is FailedLoadingTips)
                  ? const SizedBox.shrink()
                  : (state is TipsLoaded)
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            12.verticalSpace,
                            Container(
                              margin: const EdgeInsets.only(left: 32),
                              child: StandardText.bodyMediumBold(
                                context,
                                AppLocalizations.of(context)!.latest_tip_text,
                                maxLines: 1,
                                fontSize: 16,
                                color: context.theme.corePalatte.darkGrey,
                                align: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            4.verticalSpace,
                            InkWell(
                                onTap: () => AutoRouter.of(context).push(
                                    TipDetailRoute(tipId: state.tips[0].id!)),
                                child: TipsItem(
                                    displayShadow: true, tip: state.tips[0])),
                            12.verticalSpace,
                            state.tips.length == 1
                                ? const SizedBox.shrink()
                                : Container(
                                    margin: const EdgeInsets.only(left: 32),
                                    child: StandardText.bodyMediumBold(
                                      context,
                                      AppLocalizations.of(context)!
                                          .previous_tip,
                                      maxLines: 1,
                                      fontSize: 16,
                                      color: context.theme.corePalatte.darkGrey,
                                      align: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                            4.verticalSpace,
                            state.tips.length == 1
                                ? const SizedBox.shrink()
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: state.hasReachedMax
                                        ? state.tips
                                                .where((element) =>
                                                    element.id !=
                                                    state.tips[0].id)
                                                .toList()
                                                .length +
                                            1
                                        : state.tips
                                                .where((element) =>
                                                    element.id !=
                                                    state.tips[0].id)
                                                .toList()
                                                .length +
                                            2,
                                    itemBuilder: (context, index) {
                                      return index == 0
                                          ? const SizedBox.shrink()
                                          : index >=
                                                  state.tips
                                                          .where((element) =>
                                                              element.id !=
                                                              state.tips[0].id)
                                                          .toList()
                                                          .length +
                                                      1
                                              ? Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 16,
                                                  ),
                                                  child: TipLoadingShimmer(),
                                                )
                                              : InkWell(
                                                  onTap: () =>
                                                      AutoRouter.of(context)
                                                          .push(TipDetailRoute(
                                                              tipId: state
                                                                  .tips[index]
                                                                  .id!)),
                                                  child: TipsItem(
                                                      displayShadow: false,
                                                      tip: state.tips[index]));
                                    }),
                          ],
                        )
                      : const SizedBox.shrink();
        });
  }

  void _onScroll() {
    if (_isBottom) {
      getIt<TipBloc>().add(GetTips());
    }
  }

  bool get _isBottom {
    if (!widget.scrollController.hasClients) return false;
    final maxScroll = widget.scrollController.position.maxScrollExtent;
    final currentScroll = widget.scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
