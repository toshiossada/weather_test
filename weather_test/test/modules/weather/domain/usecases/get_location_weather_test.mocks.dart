// Mocks generated by Mockito 5.4.4 from annotations
// in weather_test/test/modules/weather/domain/usecases/get_location_weather_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:weather_test/modules/weather/domain/entities/location_entity.dart'
    as _i2;
import 'package:weather_test/modules/weather/domain/entities/weather_entity.dart'
    as _i3;
import 'package:weather_test/modules/weather/domain/repositories/weather_repository_interface.dart'
    as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeLocationEntity_0 extends _i1.SmartFake
    implements _i2.LocationEntity {
  _FakeLocationEntity_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWeatherEntity_1 extends _i1.SmartFake implements _i3.WeatherEntity {
  _FakeWeatherEntity_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [IWeatherRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIWeatherRepository extends _i1.Mock
    implements _i4.IWeatherRepository {
  @override
  _i5.Future<_i2.LocationEntity> getPosition(
    String? city,
    String? country,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPosition,
          [
            city,
            country,
          ],
        ),
        returnValue: _i5.Future<_i2.LocationEntity>.value(_FakeLocationEntity_0(
          this,
          Invocation.method(
            #getPosition,
            [
              city,
              country,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i2.LocationEntity>.value(_FakeLocationEntity_0(
          this,
          Invocation.method(
            #getPosition,
            [
              city,
              country,
            ],
          ),
        )),
      ) as _i5.Future<_i2.LocationEntity>);

  @override
  _i5.Future<_i3.WeatherEntity> getCurrentWeather(
          _i2.LocationEntity? location) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCurrentWeather,
          [location],
        ),
        returnValue: _i5.Future<_i3.WeatherEntity>.value(_FakeWeatherEntity_1(
          this,
          Invocation.method(
            #getCurrentWeather,
            [location],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.WeatherEntity>.value(_FakeWeatherEntity_1(
          this,
          Invocation.method(
            #getCurrentWeather,
            [location],
          ),
        )),
      ) as _i5.Future<_i3.WeatherEntity>);

  @override
  _i5.Future<List<_i3.WeatherEntity>> getNextFiveDaysWeather(
          _i2.LocationEntity? location) =>
      (super.noSuchMethod(
        Invocation.method(
          #getNextFiveDaysWeather,
          [location],
        ),
        returnValue:
            _i5.Future<List<_i3.WeatherEntity>>.value(<_i3.WeatherEntity>[]),
        returnValueForMissingStub:
            _i5.Future<List<_i3.WeatherEntity>>.value(<_i3.WeatherEntity>[]),
      ) as _i5.Future<List<_i3.WeatherEntity>>);
}