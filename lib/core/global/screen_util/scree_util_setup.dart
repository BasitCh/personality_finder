// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenUtilSetup extends StatelessWidget {
  final Widget? child;
  const ScreenUtilSetup({Key? key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData.fromWindow(WidgetsBinding.instance.window),
      child: Builder(
        builder: (context) {
          ScreenUtil.init(context,
              designSize: Size(MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height));

          return child!;
        },
      ),
    );
  }
}
