// Package imports:
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

// Project imports:
import '../global/exceptions/key_not_found_error.dart';

class HiveSetup {
  HiveSetup._();

  // Get stance of this class using instance getter
  // static HiveSetup get instance => HiveSetup._();

  static Future get initHive => _initHive();
  static Future _initHive() async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();

    Hive.init(appDocumentDir.path);
  }

  static Future<void> clearHive() async {}

  static Future<void> clearSingleBox(String boxName) async {
    await Hive.deleteBoxFromDisk(boxName);
  }

  static Future<void> clearAllBoxes() async {
    await Hive.deleteFromDisk();
  }

  static Future<LazyBox> openBox(String boxName) async {
    return Hive.isBoxOpen(boxName)
        ? Hive.lazyBox<String>(boxName)
        : await Hive.openLazyBox<String>(boxName);
  }

  static Future<bool> addBox<T>(T newBox, String boxName) async {
    final hiveBox = Hive.isBoxOpen(boxName)
        ? Hive.lazyBox<T>(boxName)
        : await Hive.openLazyBox<T>(boxName);
    final hiveBoxList = await getListFromHiveBox<T>(boxName);
    if (!hiveBoxList.contains(newBox)) {
      final i = await hiveBox.add(newBox);
      return i >= 0;
    }
    return false;
  }

  static Future<List<T>> getListFromHiveBox<T>(String boxName) async {
    final hiveBox = Hive.isBoxOpen(boxName)
        ? Hive.lazyBox<T>(boxName)
        : await Hive.openLazyBox<T>(boxName);
    final list = <T>[];
    for (var i = 0; i < hiveBox.length; i++) {
      list.add(await hiveBox.getAt(i) as T);
    }
    return list;
  }

  static Future<bool> containsKey<T>(String boxName, String key) async {
    final hiveBox = Hive.isBoxOpen(boxName)
        ? Hive.lazyBox<T>(boxName)
        : await Hive.openLazyBox<T>(boxName);
    return hiveBox.containsKey(key);
  }

  static Future<T> getItem<T>(String boxName, String key) async {
    final hiveBox = Hive.isBoxOpen(boxName)
        ? Hive.lazyBox<T>(boxName)
        : await Hive.openLazyBox<T>(boxName);
    if (hiveBox.containsKey(key)) {
      return await hiveBox.get(key) as T;
    }
    throw KeyNotFoundError('Key does not exist in the database');
  }

  static Future<void> put<T>(String boxName, String key, T value) async {
    final hiveBox = Hive.isBoxOpen(boxName)
        ? Hive.lazyBox<T>(boxName)
        : await Hive.openLazyBox<T>(boxName);

    return hiveBox.put(key, value);
  }
}
