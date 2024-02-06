import 'dart:async';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../cache_adapter.dart';
import '../models/cache_model.dart';
import 'models/cache_model_database.dart';

/// A concrete implementation of [ICacheAdapter] using Hive as the underlying
/// storage engine.
///
/// This class provides methods to store and retrieve [CacheModel] instances
/// from a Hive database.
class CacheHive implements ICacheAdapter {
  /// Usage:
  /// ```dart
  /// CacheHive();
  /// ```
  CacheHive() {
    _initDb();
  }

  final _completer = Completer<Box>();

  Future _initDb() async {
    final appDocDirectory = await getApplicationDocumentsDirectory();
    Hive
      ..init(appDocDirectory.path)
      ..registerAdapter(CacheModelDatabaseAdapter());

    final box = await Hive.openBox('cache');
    if (!_completer.isCompleted) _completer.complete(box);
  }

  @override
  Future<void> put(CacheModel data) async {
    final box = await _completer.future;
    await box.put(data.id, data.toMap());
  }

  @override
  Future<CacheModel?> get(String id) async {
    final box = await _completer.future;
    final data = await box.get(id);

    if (data == null) return null;

    return CacheModel(
      id: data['id'],
      data: data['data'],
      date: DateTime.fromMillisecondsSinceEpoch(data['date']),
    );
  }
}
