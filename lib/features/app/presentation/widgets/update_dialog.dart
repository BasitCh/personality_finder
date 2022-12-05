// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Project imports:
import '../../../../core/global/extensions/context_extensions.dart';
import '../../../../core/global/extensions/number_extensions.dart';
import '../../domain/entities/version_data.dart';

class AlertContent extends StatelessWidget {
  const AlertContent({
    required this.versionData,
    required this.isUpdateMandatory,
    Key? key,
  }) : super(key: key);

  final VersionData versionData;
  final bool isUpdateMandatory;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: context.theme.background,
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Platform.isAndroid)
              Text(
                Platform.isAndroid
                    ? '${AppLocalizations.of(context)!.new_version_text}: ${versionData.androidLatestVersionCode}'
                    : '${AppLocalizations.of(context)!.new_version_text}: ${versionData.iosLatestVersionCode}',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            if (versionData.changeLog != null &&
                versionData.changeLog!.isNotEmpty)
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Text(AppLocalizations.of(context)!.change_log_text,
                      style: Theme.of(context).textTheme.subtitle1),
                  const SizedBox(
                    height: 4,
                  ),
                  ...List.generate(
                    versionData.changeLog!.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text('- ${versionData.changeLog![index]}',
                          style: Theme.of(context).textTheme.subtitle1),
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    isUpdateMandatory
                        ? AppLocalizations.of(context)!.update_message_mandatory
                        : AppLocalizations.of(context)!.update_message,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class MaterialUpdateDialog extends StatelessWidget {
  final VersionData versionData;
  final bool isUpdateMandatory;
  const MaterialUpdateDialog({
    required this.versionData,
    required this.isUpdateMandatory,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.theme.background,
      title: Text(AppLocalizations.of(context)!.update_title),
      content: AlertContent(
        versionData: versionData,
        isUpdateMandatory: isUpdateMandatory,
      ),
      actions: [
        if (!isUpdateMandatory)
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context)!.later_text),
          ),
        TextButton(
          onPressed: () {
            // TODO: Redirect to App/Play Store.
          },
          child: Text(AppLocalizations.of(context)!.update_text),
        ),
      ],
    );
  }
}

class CupertinoUpdateDialog extends StatelessWidget {
  final VersionData versionData;
  final bool isUpdateMandatory;
  const CupertinoUpdateDialog({
    required this.versionData,
    required this.isUpdateMandatory,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(AppLocalizations.of(context)!.update_title),
      content: AlertContent(
        versionData: versionData,
        isUpdateMandatory: isUpdateMandatory,
      ),
      actions: [
        if (!isUpdateMandatory)
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context)!.later_text),
          ),
        CupertinoDialogAction(
          onPressed: () {
            // TODO: Redirect to App/Play Store.
          },
          child: Text(AppLocalizations.of(context)!.update_text),
        ),
      ],
    );
  }
}
