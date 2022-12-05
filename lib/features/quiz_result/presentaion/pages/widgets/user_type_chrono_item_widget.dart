import 'package:flutter/material.dart';
import 'package:morphosis_template/core/global/color/hex_color.dart';

import 'package:morphosis_template/core/global/extensions/context_extensions.dart';
import 'package:morphosis_template/features/app/presentation/widgets/standard_text.dart';

// ignore: must_be_immutable
class UserTypeChronoWidget extends StatelessWidget {
  String userTypeImage;
  String userTypeTitle;
  String userColor;

  UserTypeChronoWidget({
    required this.userTypeTitle,
    required this.userColor,
    required this.userTypeImage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: HexColor('$userColor')),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('$userTypeImage')),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                ),
                Flexible(
                  child: Container(
                    child: StandardText.bodyMediumBold(
                      context,
                      '$userTypeTitle',
                      maxLines: 1,
                      align: TextAlign.left,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 8),
            child: Icon(
              Icons.keyboard_arrow_right,
              color: context.theme.corePalatte.darkGrey,
            ),
          )
        ],
      ),
    );
  }
}
