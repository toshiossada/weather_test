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
      description: model.description,
      dateTime: model.dateTime,
      main: model.main,
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
      description: entity.description,
      dateTime: entity.dateTime,
      main: entity.main.capitilize(),
    );
  }
}
