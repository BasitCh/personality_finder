// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:morphosis_template/core/global/extensions/number_extensions.dart';
import 'package:morphosis_template/features/quiz_result/presentaion/pages/widgets/second_ring_widget.dart';
import 'package:morphosis_template/features/quiz_result/presentaion/pages/widgets/simple_ring_widget.dart';

class SimplePersonAvatar extends StatelessWidget {
  String? avatarUrl;
  String? colorCodeData;

  //
  SimplePersonAvatar({
    this.colorCodeData,
    this.avatarUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200.flexibleWidth,
        height: 100.flexibleHeight,
        child: Stack(
          children: [
            SimpleRingWidget(
              colorCode: '$colorCodeData',
            ),
            // ignore: prefer_const_constructors
            SecondRing(),
            Positioned(
              top: 8,
              bottom: 8,
              left: 8,
              right: 8,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: avatarUrl == null
                        ? const DecorationImage(
                            image: AssetImage('assets/images/icons/avatar.png'),
                            fit: BoxFit.contain,
                          )
                        : DecorationImage(
                            image: CachedNetworkImageProvider('$avatarUrl'),
                            fit: BoxFit.contain,
                          )),
              ),
            )
          ],
        ));
  }
}
