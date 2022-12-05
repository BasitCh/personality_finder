import 'package:flutter/material.dart';
import 'package:morphosis_template/core/global/extensions/number_extensions.dart';
import 'package:morphosis_template/features/app/presentation/widgets/shimmer_widget.dart';

class TipDetailsLoadingShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ShimmerContainer(
                height: 20,
                width: 80,
                borderRadius: 60,
                type: ShimmerType.circle,
              ),
              8.verticalSpace,
              const ShimmerContainer(
                height: 20,
                type: ShimmerType.square,
              ),
              8.verticalSpace,
              const ShimmerContainer(
                height: 20,
                width: 80,
                borderRadius: 60,
                type: ShimmerType.circle,
              ),
              20.verticalSpace,
              const ShimmerContainer(
                type: ShimmerType.square,
                height: 200,
              ),
              16.verticalSpace,
              const ShimmerContainer(
                type: ShimmerType.square,
                height: 20,
              ),
              8.verticalSpace,
              const ShimmerContainer(
                type: ShimmerType.square,
                height: 20,
                width: 150,
              ),
              8.verticalSpace,
              const ShimmerContainer(
                type: ShimmerType.square,
                height: 20,
                width: 120,
              ),
              40.verticalSpace,

              const ShimmerContainer(
                type: ShimmerType.square,
                height: 40,

              ),
            ],
          )),
    );
  }
}
