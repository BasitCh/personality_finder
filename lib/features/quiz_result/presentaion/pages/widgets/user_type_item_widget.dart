import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:morphosis_template/core/global/color/hex_color.dart';

import 'package:morphosis_template/core/global/extensions/context_extensions.dart';
import 'package:morphosis_template/features/app/presentation/widgets/standard_text.dart';

// ignore: must_be_immutable
class UserTypeItemWidget extends StatelessWidget {
  String userColor;
  String userTypeImage;
  String psychoTypeName;
  String psychoTypeTitle;

  UserTypeItemWidget({
    required this.userColor,
    required this.userTypeImage,
    required this.psychoTypeName,
    required this.psychoTypeTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.symmetric(vertical: 10),
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
                        fit: BoxFit.contain,
                        scale: 2,
                        image: CachedNetworkImageProvider('$userTypeImage',
                            scale: 3)),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                ),
                Flexible(
                    child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StandardText.bodyMedium(
                        context,
                        '$psychoTypeName',
                        maxLines: 1,
                        fontSize: 12,
                        color: context.theme.corePalatte.gray,
                        align: TextAlign.left,
                        overflow: TextOverflow.visible,
                      ),
                      Container(
                        child: StandardText.bodyMediumBold(
                          context,
                          '$psychoTypeTitle',
                          maxLines: 1,
                          fontSize: 16,
                          align: TextAlign.left,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                )),
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
