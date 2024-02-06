/// An abstract base class that defines the interface for mapping between
/// two types.
///
/// This generic class provides a contract for converting between a model
/// object (R)
/// and an entity object (T). Implementations of this class should provide
/// concrete
/// methods for these conversions.
///
/// Usage:
/// ```dart
/// class UserMapper extends BaseMapper<UserEntity, UserModel> {
///   @override
///   UserEntity toEntity(UserModel model) {
///     return UserEntity(model.name);
///   }
///
///   @overrid
///   UserModel toModel(UserEntity entity) {
///     return UserModel(entity.name);
///   }
/// }
/// ```
abstract base class BaseMapper<T, R> {
  /// Converts a model object of type [R] to an entity object of type [T].
  ///
  /// Implementations should define the logic to convert from the model
  /// representation
  /// to the entity representation.
  ///
  /// - `model`: The model object to be converted to an entity.
  ///
  /// Returns an entity object of type [T].
  T toEntity(R model);

  /// Converts an entity object of type [T] to a model object of type [R].
  ///
  /// Implementations should define the logic to convert from the entity
  /// representation
  /// to the model representation.
  ///
  /// - `entity`: The entity object to be converted to a model.
  ///
  /// Returns a model object of type [R].
  R toModel(T entity);
}
