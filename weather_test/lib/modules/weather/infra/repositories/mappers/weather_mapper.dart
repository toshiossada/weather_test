import '../../../../core/base_mapper.dart';
import '../../../domain/entities/weather_entity.dart';
import '../models/weather_model.dart';

final class WeatherMapper extends BaseMapper<WeatherEntity, WeatherModel> {
  @override
  WeatherEntity toEntity(WeatherModel model) {
    return WeatherEntity(
      temp: model.temp,
      feelsLike: model.feelsLike,
      tempMin: model.tempMin,
      tempMax: model.tempMax,
      humidity: model.humidity,
    );
  }

  @override
  WeatherModel toModel(WeatherEntity entity) {
    return WeatherModel(
      temp: entity.temp,
      feelsLike: entity.feelsLike,
      tempMin: entity.tempMin,
      tempMax: entity.tempMax,
      humidity: entity.humidity,
    );
  }
}
