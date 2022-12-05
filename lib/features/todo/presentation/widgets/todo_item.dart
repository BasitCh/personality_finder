// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import '../../../../core/global/extensions/context_extensions.dart';

class TodoItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool status;
  const TodoItem({
    required this.title,
    required this.subtitle,
    required this.status,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: ScreenUtil.defaultSize.height / 7.1,
      width: ScreenUtil.defaultSize.width,
      color: context.theme.surface,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text('$title',
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontWeight: FontWeight.bold)),
            const Divider(),
            Text('$subtitle',
                maxLines: 1, style: Theme.of(context).textTheme.subtitle2),
          ],
        ),
      ),
    );
  }
}
