import 'package:flutter_test/flutter_test.dart';
import 'package:weather_test/modules/weather/domain/enums/weather_enum.dart';

void main() {
  testWidgets(
      'Given a String '
      'When fromString called '
      'Should convert to respective WeatherEnum', (tester) async {
    expect(WeatherEnum.fromString('Rain'), WeatherEnum.rain);
    expect(WeatherEnum.fromString('Snow'), WeatherEnum.snow);
    expect(WeatherEnum.fromString('Clouds'), WeatherEnum.clouds);
    expect(WeatherEnum.fromString('Sun'), WeatherEnum.sun);
    expect(WeatherEnum.fromString('XPTO'), WeatherEnum.sun);
  });
  testWidgets(
      'Given a WeatherEnum '
      'When capitalize called '
      'Should capitalize Strng value', (tester) async {
    expect(WeatherEnum.rain.capitalize(), 'Rain');
    expect(WeatherEnum.snow.capitalize(), 'Snow');
    expect(WeatherEnum.clouds.capitalize(), 'Clouds');
    expect(WeatherEnum.sun.capitalize(), 'Sun');
  });
}
