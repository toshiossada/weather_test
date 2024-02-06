import 'models/cache_model.dart';

/// An abstract class that defines the interface for cache adapters.
///
/// The cache adapter is responsible for storing and retrieving [CacheModel]
/// instances, typically involving some form of persistent or temporary storage.
///
/// Implementers of this interface should provide concrete implementations for
/// the methods defined herein to handle cache-related operations.
abstract class ICacheAdapter {
  /// Retrieves a [CacheModel] instance associated with the given [id].
  Future<CacheModel?> get(String id);

  /// Update or Insert [CacheModel]
  Future<void> put(CacheModel data);
}
