import 'package:flutter/material.dart';
import 'package:morphosis_template/core/global/extensions/number_extensions.dart';
import 'package:morphosis_template/features/app/presentation/widgets/shimmer_widget.dart';

class LoadingShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ShimmerContainer(
                height: 120,
                width: 120,
                borderRadius: 60,
                type: ShimmerType.circle,
              ),
              16.verticalSpace,
              const ShimmerContainer(
                width: 130,
                height: 30,
                type: ShimmerType.square,
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
                width: 80,
              ),
            ],
          )),
    );
  }
}
