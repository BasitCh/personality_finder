// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:permission_handler/permission_handler.dart';

// Project imports:
import 'functions.dart';
import 'widgets/permission_dialog.dart';

/// [PermissionChecker] class handle all permission checking stuff in fonepay app
/// You have to pass [BuildContext] which is used to display bottom sheet.
class PermissionChecker {
  static Future<bool> hasLocationPermission(BuildContext context) async {
//
    /// For android point of view this boolean flag is most important.
    /// Android will keep asking for permission until we check never ask again option.
    /// So to prevent apearing module bottom sheet we have store [isFirstTime] boolean flag
    /// in shared preference. At first isFirstTime will be false, as soon as user click specific
    /// button isFirstTime flag is set to true. After that isFirstTime value will be true untill user
    /// uninstall app.
    final isFirstTime = await PermissionFuncs().isFirstTimeLocationRequest();

    /// Current permission status for camera
    var status = await Permission.location.status;

    if (status.isDenied) {
      if (Platform.isAndroid) {
        final show = await Permission.location.shouldShowRequestRationale;

        /// If this is not first time click and if showing permission aleart box is false
        /// only then display bottom sheet else ask for permission
        if (!isFirstTime && !show) {
          PermissionDialog(
            permissionFor: 'location',
            context: context,
          );
        } else {
          await Permission.location.request();
          status = await Permission.location.status;
        }
      } else if (Platform.isIOS) {
        PermissionDialog(
          permissionFor: 'location',
          context: context,
        );
      }
    }

    if (status.isPermanentlyDenied || status.isRestricted) {
      PermissionDialog(
        permissionFor: 'location',
        context: context,
        // ignore: avoid_bool_literals_in_conditional_expressions
        disabled: status.isPermanentlyDenied ? Platform.isAndroid : false,
      );
    }

    return status == PermissionStatus.granted;
  }

  static Future<bool> hasStoragePermission(BuildContext context) async {
    final isFirstTime = await PermissionFuncs().isFirstTimeStoragePermission();
    var status = Platform.isAndroid
        ? await Permission.storage.status
        : await Permission.photos.status;

    if (status.isDenied) {
      if (Platform.isAndroid) {
        final show = await Permission.storage.shouldShowRequestRationale;

        if (!isFirstTime && !show) {
          PermissionDialog(
            permissionFor: 'storage',
            context: context,
          );
        } else {
          await Permission.storage.request();
          status = await Permission.storage.status;
        }
      } else if (Platform.isIOS) {
        final show = await Permission.storage.request();

        if (show.isDenied) {
          PermissionDialog(
            permissionFor: 'photos',
            context: context,
          );
        } else {
          await Permission.storage.request();
          status = await Permission.storage.status;
        }
      } else {
        PermissionDialog(
          permissionFor: 'photos',
          context: context,
        );
      }
    }

    if (status.isPermanentlyDenied || status.isRestricted) {
      PermissionDialog(
        permissionFor: 'photos',
        context: context,
      );
    }

    return status == PermissionStatus.granted;
  }

  static Future<bool> hasCameraPermission(BuildContext context) async {
    final isFirstTime = await PermissionFuncs().isFirstTimeCameraPermission();

    var status = await Permission.camera.status;

    if (status.isDenied) {
      if (Platform.isAndroid) {
        final show = await Permission.camera.shouldShowRequestRationale;

        if (!isFirstTime && !show) {
          PermissionDialog(
            permissionFor: 'camera',
            context: context,
          );
        } else {
          await Permission.camera.request();
          status = await Permission.camera.status;
        }
      } else if (Platform.isIOS) {
        PermissionDialog(
          permissionFor: 'camera',
          context: context,
        );
      }
    }

    if (status.isPermanentlyDenied || status.isRestricted) {
      PermissionDialog(
        permissionFor: 'storage',
        context: context,
      );
    }

    return status == PermissionStatus.granted;
  }

  static Future<bool> hasContactsPermission(BuildContext context) async {
    final isFirstTime = await PermissionFuncs().isFirstTimeContactsPermission();

    var status = await Permission.contacts.status;

    if (status.isDenied) {
      if (Platform.isAndroid) {
        final show = await Permission.contacts.shouldShowRequestRationale;

        if (!isFirstTime && !show) {
          PermissionDialog(
            permissionFor: 'contacts',
            context: context,
          );
        } else {
          await Permission.contacts.request();
          status = await Permission.contacts.status;
        }
      } else if (Platform.isIOS) {
        PermissionDialog(
          permissionFor: 'contacts',
          context: context,
        );
      }
    }

    if (status.isPermanentlyDenied || status.isRestricted) {
      PermissionDialog(
        permissionFor: 'contacts',
        context: context,
      );
    }

    return status == PermissionStatus.granted;
  }

  static Future<bool> hasMicrophonePermission(BuildContext context) async {
    final isFirstTime =
        await PermissionFuncs().isFirstTimeMicrophonePermission();

    var status = await Permission.microphone.status;

    if (status.isDenied) {
      if (Platform.isAndroid) {
        final show = await Permission.microphone.shouldShowRequestRationale;

        if (!isFirstTime && !show) {
          PermissionDialog(
            permissionFor: 'microphone',
            context: context,
          );
        } else {
          await Permission.microphone.request();
          status = await Permission.microphone.status;
        }
      } else if (Platform.isIOS) {
        PermissionDialog(
          permissionFor: 'microphone',
          context: context,
        );
      }
    }

    if (status.isPermanentlyDenied || status.isRestricted) {
      PermissionDialog(
        permissionFor: 'storage',
        context: context,
      );
    }

    return status == PermissionStatus.granted;
  }

  static Future<bool> hasSpeechPermission(BuildContext context) async {
    final isFirstTime = await PermissionFuncs().isFirstTimeSpeechPermission();

    var status = await Permission.speech.status;

    if (status.isDenied) {
      if (Platform.isAndroid) {
        final show = await Permission.speech.shouldShowRequestRationale;

        if (!isFirstTime && !show) {
          PermissionDialog(
            permissionFor: 'speech',
            context: context,
          );
        } else {
          await Permission.speech.request();
          status = await Permission.speech.status;
        }
      } else if (Platform.isIOS) {
        PermissionDialog(
          permissionFor: 'speech',
          context: context,
        );
      }
    }

    if (status.isPermanentlyDenied || status.isRestricted) {
      PermissionDialog(
        permissionFor: 'speech',
        context: context,
      );
    }

    return status == PermissionStatus.granted;
  }

  static Future<bool> hasNoificationPermission(BuildContext context) async {
    final isFirstTime =
        await PermissionFuncs().isFirstTimeNotificationPermission();

    var status = await Permission.notification.status;

    if (status.isDenied) {
      if (Platform.isAndroid) {
        final show = await Permission.notification.shouldShowRequestRationale;

        if (!isFirstTime && !show) {
          PermissionDialog(
            permissionFor: 'notification',
            context: context,
          );
        } else {
          await Permission.notification.request();
          status = await Permission.notification.status;
        }
      } else if (Platform.isIOS) {
        PermissionDialog(
          permissionFor: 'notification',
          context: context,
        );
      }
    }

    if (status.isPermanentlyDenied || status.isRestricted) {
      PermissionDialog(
        permissionFor: 'notification',
        context: context,
      );
    }

    return status == PermissionStatus.granted;
  }

  static Future<bool> hasMediaLibraryPermission(BuildContext context) async {
    final isFirstTime =
        await PermissionFuncs().isFirstTimeMediaLibraryPermission();

    var status = await Permission.mediaLibrary.status;

    if (status.isDenied) {
      if (Platform.isAndroid) {
        final show = await Permission.mediaLibrary.shouldShowRequestRationale;

        if (!isFirstTime && !show) {
          PermissionDialog(
            permissionFor: 'medialibrary',
            context: context,
          );
        } else {
          await Permission.mediaLibrary.request();
          status = await Permission.mediaLibrary.status;
        }
      } else if (Platform.isIOS) {
        final show = await Permission.mediaLibrary.shouldShowRequestRationale;

        if (!isFirstTime && !show) {
          PermissionDialog(
            permissionFor: 'medialibrary',
            context: context,
          );
        } else {
          await Permission.mediaLibrary.request();
          status = await Permission.mediaLibrary.status;
        }
        // PermissionDialog(
        //   permissionFor: 'medialibrary',
        //   context: context,
        // );
      } else {
        PermissionDialog(
          permissionFor: 'medialibrary',
          context: context,
        );
      }
    }

    if (status.isPermanentlyDenied || status.isRestricted) {
      PermissionDialog(
        permissionFor: 'medialibrary',
        context: context,
      );
    }

    return status == PermissionStatus.granted;
  }

  static Future<bool> hasCalenderPermission(BuildContext context) async {
    final isFirstTime = await PermissionFuncs().isFirstTimeCalenderPermission();

    var status = await Permission.calendar.status;

    if (status.isDenied) {
      if (Platform.isAndroid) {
        final show = await Permission.calendar.shouldShowRequestRationale;

        if (!isFirstTime && !show) {
          PermissionDialog(
            permissionFor: 'calender',
            context: context,
          );
        } else {
          await Permission.calendar.request();
          status = await Permission.calendar.status;
        }
      } else if (Platform.isIOS) {
        PermissionDialog(
          permissionFor: 'calender',
          context: context,
        );
      }
    }

    if (status.isPermanentlyDenied || status.isRestricted) {
      PermissionDialog(
        permissionFor: 'calender',
        context: context,
      );
    }

    return status == PermissionStatus.granted;
  }

  static Future<bool> hasReminderPermission(BuildContext context) async {
    final isFirstTime = await PermissionFuncs().isFirstTimeReminderPermission();

    var status = await Permission.reminders.status;

    if (status.isDenied) {
      if (Platform.isAndroid) {
        final show = await Permission.reminders.shouldShowRequestRationale;

        if (!isFirstTime && !show) {
          PermissionDialog(
            permissionFor: 'reminder',
            context: context,
          );
        } else {
          await Permission.reminders.request();
          status = await Permission.reminders.status;
        }
      } else if (Platform.isIOS) {
        PermissionDialog(
          permissionFor: 'reminder',
          context: context,
        );
      }
    }

    if (status.isPermanentlyDenied || status.isRestricted) {
      PermissionDialog(
        permissionFor: 'reminder',
        context: context,
      );
    }

    return status == PermissionStatus.granted;
  }
}
//////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////

