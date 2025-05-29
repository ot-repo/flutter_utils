extension MapExt on Map {
  T? getPrimitiveType<T>(String key) {
    if (this[key] == null) return null;

    if (T == String) {
      return this[key].toString() as T;
    }

    if (T == int) {
      return int.tryParse(this[key].toString()) as T;
    }

    if (T == double) {
      return double.tryParse(this[key].toString()) as T;
    }

    return this[key] as T;
  }

  List<T> getPrimitiveTypedList<T>(String key) {
    if (this[key] == null || (this[key] as List).isEmpty) {
      return <T>[];
    }

    return (this[key] as List<dynamic>).cast<T>();
  }

  List<T> getComplexTypedList<T>(String key, T Function(Map<String, dynamic>) fromMap) {
    if (this[key] == null || (this[key] as List).isEmpty) {
      return <T>[];
    }

    return (this[key] as List).nonNulls.map((e) => e.runtimeType == T ? e as T : fromMap(e as Map<String, dynamic>)).toList();
  }

  Map<TKey, TValue> getMapType<TKey, TValue>(String key) {
    if (this[key] == null) {
      return {};
    }

    return (this[key] as Map<dynamic, dynamic>).map((k, v) => MapEntry(k as TKey, v as TValue));
  }

  DateTime? getDateTime(String key) {
    final value = this[key];
    if (value is String) {
      return DateTime.tryParse(value);
    }
    return null;
  }
}
