import 'package:flutter/material.dart';
import 'package:morphosis_template/core/global/extensions/context_extensions.dart';
import 'package:morphosis_template/features/app/presentation/widgets/standard_text.dart';

class ItemWidget extends StatelessWidget {
  final String content;
  final bool isSelected;
  const ItemWidget({required this.content, required this.isSelected, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected
              ? context.theme.corePalatte.darkBlue
              : context.theme.corePalatte.white,
          border: Border.all(color: context.theme.corePalatte.darkBlue),
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(12),
            right: Radius.circular(12),
          ),
        ),
        child: StandardText.bodySmallMedium(
          context,
          '$content',
          maxLines: 1,
          fontSize: 16,
          color: isSelected
              ? context.theme.corePalatte.white
              : context.theme.corePalatte.darkBlue,
          align: TextAlign.left,
          overflow: TextOverflow.visible,
        ),
      ),
    );
  }
}
