// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:morphosis_template/core/global/color/hex_color.dart';
import 'package:morphosis_template/core/global/extensions/number_extensions.dart';
import 'package:morphosis_template/features/quiz_result/presentaion/pages/widgets/ring_widget.dart';
import 'package:morphosis_template/features/quiz_result/presentaion/pages/widgets/second_ring_widget.dart';

class MixPersonAvatar extends StatelessWidget {
  String? avatarUrl;
  String colorPrimaryTrait;
  String colorSecondaryTrait;

  MixPersonAvatar({
    required this.avatarUrl,
    required this.colorPrimaryTrait,
    required this.colorSecondaryTrait,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: HexColor(colorPrimaryTrait),
      shape: const CircleBorder(),
      color: Colors.white,
      child: Container(
          width: 200.flexibleWidth,
          height: 100.flexibleHeight,
          child: Stack(
            children: [
              RingWidget(
                colorPrimaryTrait: colorPrimaryTrait,
                colorSecondaryTrait: colorSecondaryTrait,
              ),
              const SecondRing(),
              Positioned(
                top: 10,
                bottom: 10,
                left: 10,
                right: 10,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: avatarUrl == null
                          ? const DecorationImage(
                              image: AssetImage(
                                'assets/images/icons/avatar.png',
                              ),
                              fit: BoxFit.contain,
                            )
                          : DecorationImage(
                              image: CachedNetworkImageProvider('$avatarUrl'),
                              fit: BoxFit.contain,
                            )),
                ),
              )
            ],
          )),
    );
  }
}
