// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// Package imports:
import 'package:permission_handler/permission_handler.dart';

// Project imports:
import '../../../../extensions/context_extensions.dart';
import '../../../../extensions/number_extensions.dart';

class PermissionDialog extends StatelessWidget {
  final String permissionFor;
  final BuildContext context;
  final bool disabled;
  PermissionDialog({
    required this.context,
    required this.permissionFor,
    this.disabled = false,
  }) {
    openDialog();
  }
  Future openDialog() {
    return showDialog<PermissionDialog>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return this;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.only(bottom: 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 30.flexibleHeight),
          color: context.theme.background,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 11.flexibleHeight),
                child: Text(
                  AppLocalizations.of(context)!.permission_required_text,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: context.theme.onBackground,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Text(
                  'Our app requires $permissionFor permission for all features to work properly. Please enabled the permission in settings.',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: context.theme.onBackgroundLight,
                        fontWeight: FontWeight.w500,
                        height: 1.6,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.flexibleHeight),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        top:
                            BorderSide(width: 1, color: context.theme.surface)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: InkWell(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              AppLocalizations.of(context)!.not_now_text,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    color: context.theme.onBackgroundLight,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 34,
                        width: 1,
                        color: context.theme.corePalatte.greyColor,
                      ),
                      Flexible(
                        flex: 1,
                        child: InkWell(
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(10),
                          ),
                          onTap: () async {
                            await openAppSettings();
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              AppLocalizations.of(context)!.open_settings_text,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    color:
                                        context.theme.corePalatte.primaryColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
