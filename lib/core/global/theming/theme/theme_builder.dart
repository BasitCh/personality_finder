// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import '../theme_cubit/theme_cubit.dart';
import 'theme_palatte.dart';

class ThemeBuilder extends StatefulWidget {
  final Widget Function(BuildContext, ThemePalatte)? builder;

  const ThemeBuilder({
    Key? key,
    this.builder,
  }) : super(key: key);

  @override
  _ThemeBuilderState createState() => _ThemeBuilderState();
}

class _ThemeBuilderState extends State<ThemeBuilder> {
  Key _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeCubit, ThemePalatte>(
      key: _key,
      builder: widget.builder!,
      listener: (context, palatte) {
        _key = UniqueKey();
      },
    );
  }

  //
}
