// Dart imports:
import 'dart:async';

// Package imports:
import 'package:hive/hive.dart';

// Project imports:
import 'strings/messages.dart';

class PermissionFuncs {
  String getLng() {
    return 'adsf';
  }

  String getMessage(String permissionType) {
    switch (permissionType) {
      case 'storage':
        {
          return Strings.storageMessage;
        }
      case 'location':
        {
          return Strings.locationMessage;
        }
      case 'camera':
        {
          return Strings.cameraMessage;
        }
      case 'photo':
        {
          return Strings.photoLibraryMessage;
        }
      case 'contacts':
        {
          return Strings.contactMessage;
        }
      case 'microphone':
        {
          return Strings.microphoneMessage;
        }
      case 'speech':
        {
          return Strings.speechMessage;
        }
      case 'notifications':
        {
          return Strings.notificationMessage;
        }
      case 'medialibrary':
        {
          return Strings.mediaLibraryMessage;
        }
      case 'calender':
        {
          return Strings.calenderMessage;
        }
      case 'reminder':
        {
          return Strings.reminderMessage;
        }
      default:
        {
          return '';
        }
    }
  }

  Future<bool> isFirstTimeStoragePermission() async {
    const firstTImeStorageRequest = 'firstTImeStorageRequest';
    final box = await Hive.openBox<bool>(firstTImeStorageRequest);
    if (box.containsKey(firstTImeStorageRequest)) {
      return false;
    } else {
      unawaited(box.put(firstTImeStorageRequest, true));
      return true;
    }
  }

  Future<bool> isFirstTimeLocationRequest() async {
    const firstTimeLocationRequest = 'firstTimeLocationRequest';
    final box = await Hive.openBox<bool>(firstTimeLocationRequest);
    if (box.containsKey(firstTimeLocationRequest)) {
      return false;
    } else {
      unawaited(box.put(firstTimeLocationRequest, true));
      return true;
    }
  }

  Future<bool> isFirstTimeCameraPermission() async {
    const firstTimeCameraRequest = 'firstTimeCameraRequest';
    final box = await Hive.openBox<dynamic>(firstTimeCameraRequest);
    if (box.containsKey(firstTimeCameraRequest)) {
      return false;
    } else {
      unawaited(box.put(firstTimeCameraRequest, true));
      return true;
    }
  }

  Future<bool> isFirstTimeContactsPermission() async {
    const firstTimeContactsRequest = 'firstTimeContactsRequest';
    final box = await Hive.openBox<dynamic>(firstTimeContactsRequest);
    if (box.containsKey(firstTimeContactsRequest)) {
      return false;
    } else {
      unawaited(box.put(firstTimeContactsRequest, true));
      return true;
    }
  }

  Future<bool> isFirstTimeMicrophonePermission() async {
    const firstTimeMicrophoneRequest = 'firstTimeMicrophoneRequest';
    final box = await Hive.openBox<dynamic>(firstTimeMicrophoneRequest);
    if (box.containsKey(firstTimeMicrophoneRequest)) {
      return false;
    } else {
      unawaited(box.put(firstTimeMicrophoneRequest, true));
      return true;
    }
  }

  Future<bool> isFirstTimeSpeechPermission() async {
    const firstTimeSpeechRequest = 'firstTimeSpeechRequest';
    final box = await Hive.openBox<dynamic>(firstTimeSpeechRequest);
    if (box.containsKey(firstTimeSpeechRequest)) {
      return false;
    } else {
      unawaited(box.put(firstTimeSpeechRequest, true));
      return true;
    }
  }

  Future<bool> isFirstTimeNotificationPermission() async {
    const firstTimeNotificationRequest = 'firstTimeNotificationRequest';
    final box = await Hive.openBox<dynamic>(firstTimeNotificationRequest);
    if (box.containsKey(firstTimeNotificationRequest)) {
      return false;
    } else {
      unawaited(box.put(firstTimeNotificationRequest, true));
      return true;
    }
  }

  Future<bool> isFirstTimeMediaLibraryPermission() async {
    const firstTimeMediaLibraryRequest = 'firstTimeMediaLibraryRequest';
    final box = await Hive.openBox<dynamic>(firstTimeMediaLibraryRequest);
    if (box.containsKey(firstTimeMediaLibraryRequest)) {
      return false;
    } else {
      unawaited(box.put(firstTimeMediaLibraryRequest, true));
      return true;
    }
  }

  Future<bool> isFirstTimeCalenderPermission() async {
    const firstTimeCalenderRequest = 'firstTimeCalenderRequest';
    final box = await Hive.openBox<dynamic>(firstTimeCalenderRequest);
    if (box.containsKey(firstTimeCalenderRequest)) {
      return false;
    } else {
      unawaited(box.put(firstTimeCalenderRequest, true));
      return true;
    }
  }

  Future<bool> isFirstTimeReminderPermission() async {
    const firstTimeReminderRequest = 'firstTimeReminderRequest';
    final box = await Hive.openBox<dynamic>(firstTimeReminderRequest);
    if (box.containsKey(firstTimeReminderRequest)) {
      return false;
    } else {
      unawaited(box.put(firstTimeReminderRequest, true));
      return true;
    }
  }
}
