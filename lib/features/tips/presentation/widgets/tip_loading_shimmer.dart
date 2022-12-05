import 'package:flutter/material.dart';
import 'package:morphosis_template/core/global/extensions/number_extensions.dart';
import 'package:morphosis_template/features/app/presentation/widgets/shimmer_widget.dart';

class TipLoadingShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ShimmerContainer(
            height: 120,
            width: 120,
            type: ShimmerType.square,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ShimmerContainer(
                  width: 80,
                  height: 30,
                  type: ShimmerType.square,
                ),
                const SizedBox(height: 8),
                const ShimmerContainer(
                  type: ShimmerType.square,
                  height: 20,
                ),
                8.verticalSpace,
                const ShimmerContainer(
                  type: ShimmerType.square,
                  height: 20,
                ),
                8.verticalSpace,
                Row(
                  children: [
                    const Expanded(
                      child: ShimmerContainer(
                        type: ShimmerType.square,
                        height: 20,
                      ),
                    ),
                    16.horizontalSpace,
                    const Expanded(
                      child: ShimmerContainer(
                        type: ShimmerType.square,
                        height: 20,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
