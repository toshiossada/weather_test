import 'package:flutter_test/flutter_test.dart';
import 'package:weather_test/modules/weather/domain/entities/weather_entity.dart';
import 'package:weather_test/modules/weather/domain/enums/weather_enum.dart';

void main() {
  test(
      'Given a WeatherEntity '
      'When dateTime is 2021-10-30 12:31:15 '
      'AND main is Rain '
      'Then date should be formated date 30/10/2021 '
      'AND time should be formated time 12:31 '
      'AND main should be WeatherEnum.rain', () async {
    final weather = WeatherEntity(
      temp: 10,
      feelsLike: 12,
      tempMin: 13,
      tempMax: 13,
      humidity: 13,
      description: 'Testing',
      dateTime: DateTime(2021, 10, 30, 12, 31, 15),
      main: 'Rain',
    );

    expect(weather.date, '30/10/2021');
    expect(weather.time, '12:31');
    expect(weather.main, WeatherEnum.rain);
  });
}
