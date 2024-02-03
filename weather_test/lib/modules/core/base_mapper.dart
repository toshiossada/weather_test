abstract base class BaseMapper<T, R> {
  T toEntity(R model);
  R toModel(T entity);
}
