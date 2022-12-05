// Package imports:
import 'package:tuple/tuple.dart';

extension IterableExtension<T> on Iterable<T> {
  /// Counts all elements for which [where] returns true
  int count(bool Function(T) where) {
    var c = 0;
    for (final element in this) {
      if (where(element)) {
        ++c;
      }
    }
    return c;
  }

  E sum<E extends num>(E Function(T) valueProducer) {
    num value = 0;
    // ignore: avoid_as
    forEach((e) => value = value + valueProducer(e) as E);
    // ignore: avoid_as
    return value as E;
  }

  /// Finds the first item that matches [where], if no such item could be found
  /// returns `null`
  T? find(bool Function(T) where) {
    for (final element in this) {
      if (where(element)) return element;
    }
    return null;
  }

  /// Returns `true` if every item matches [where]
  bool all(bool Function(T) where) {
    for (final element in this) {
      if (!where(element)) {
        return false;
      }
    }
    return true;
  }

  /// Create a map by mapping every element using [key]. Duplicate values
  /// are discarded
  Map<S, T> associateBy<S>(S Function(T) key) {
    final map = <S, T>{};
    for (final element in this) {
      map[key(element)] = element;
    }
    return map;
  }

  /// Splits the elements according to [on]. Items for which [on] is true will
  /// be stored in [Tuple2.item1], other items in [Tuple2.item2]
  Tuple2<List<T>, List<T>> split(bool Function(T) on) {
    final left = <T>[];
    final right = <T>[];
    forEach((element) {
      if (on(element)) {
        left.add(element);
      } else {
        right.add(element);
      }
    });

    return Tuple2(left, right);
  }

  /// Same as [Iterable.map] except that the [mapper] function also receives
  /// the index of the item being mapped
  Iterable<R> mapIndexed<R>(R Function(int, T) mapper) {
    var c = 0;
    return map((element) => mapper(c++, element));
  }

  // ignore: comment_references
  /// Same as [Iterable.foreach] except that the [f] function also receives
  /// the index of the item
  void forEachIndexed(Function(int, T) f) {
    var index = 0;
    return forEach((element) => f(index++, element));
  }
}

/// Extension on lists
extension ListIterableExtension<T> on Iterable<Iterable<T>> {
  /// Flattens the list of lists to a single flat list of items
  List<T> flatten() {
    final newList = <T>[];
    forEach(newList.addAll);
    return newList;
  }
}
