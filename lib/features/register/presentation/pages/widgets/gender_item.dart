// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import '../../../../../core/global/extensions/number_extensions.dart';
import '../../../../app/presentation/widgets/standard_text.dart';

class GenderItem extends StatelessWidget {
  final GenderItemData _item;
  final bool? isEditProfile;

  const GenderItem(this._item, {this.isEditProfile = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          isEditProfile!
              ? SvgPicture.asset(_item.isSelected
                  ? 'assets/images/icons/circle_checked.svg'
                  : 'assets/images/icons/circle_unchecked.svg')
              : SvgPicture.asset(_item.isSelected
                  ? 'assets/images/icons/checked.svg'
                  : 'assets/images/icons/unchecked.svg'),
          5.horizontalSpace,
          StandardText.label(context, _item.gender)
        ],
      ),
    );
  }
}

class GenderItemData {
  bool isSelected;
  final String gender;

  GenderItemData({required this.isSelected, required this.gender});
}
