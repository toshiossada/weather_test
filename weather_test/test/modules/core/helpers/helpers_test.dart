import 'package:flutter_test/flutter_test.dart';
import 'package:weather_test/modules/core/helpers/helpers.dart';
import 'package:weather_test/modules/core/helpers/helpers_errors.dart';

void main() {
  test(
      'Given Map of user '
      'When age is missing '
      'AND age is required '
      'Should throw a RequiredKeysError', () async {
    const value = {
      'name': 'João',
    };

    expect(
        () => DefaultHelpers.checkKeys(
              value,
              requiredKeys: ['name', 'age'],
              disallowNullValues: ['name', 'age'],
              objName: 'User',
            ),
        throwsA(predicate((e) =>
            e is RequiredKeysError &&
            e.message ==
                'Trying to deserialize User got error. '
                    'These keys are required: [age]!',),),);
  });

  test(
      'Given Map  '
      'When map is empty '
      'AND name is required '
      'AND age is required '
      'Should throw a RequiredKeysError', () async {
    const value = <String, dynamic>{};

    expect(
        () => DefaultHelpers.checkKeys(
              value,
              requiredKeys: ['name', 'age'],
              disallowNullValues: ['name', 'age'],
              objName: 'User',
            ),
        throwsA(predicate((e) =>
            e is RequiredKeysError &&
            e.message ==
                'Trying to deserialize User got error. '
                    'These keys are required: [name, age]!',),),);
  });

  test(
      'Given Map of user '
      'When age is null '
      'AND age is not allowed null '
      'Should throw a RequiredKeysError', () async {
    const value = {
      'name': 'João',
      'age': null,
    };

    expect(
        () => DefaultHelpers.checkKeys(
              value,
              requiredKeys: ['name', 'age'],
              disallowNullValues: ['name', 'age'],
              objName: 'User',
            ),
        throwsA(predicate((e) =>
            e is DisallowedNullValueError &&
            e.message ==
                'Trying to deserialize User got error. '
                    'These keys had `null` values, which is not allowed: [age]',),),);
  });
  test(
      'Given Map of user '
      'When map is empty '
      'AND name is not allowed null '
      'AND age is not allowed null '
      'Should throw a RequiredKeysError', () async {
    const value = {
      'name': null,
      'age': null,
    };

    expect(
        () => DefaultHelpers.checkKeys(
              value,
              requiredKeys: ['name', 'age'],
              disallowNullValues: ['name', 'age'],
              objName: 'User',
            ),
        throwsA(predicate((e) =>
            e is DisallowedNullValueError &&
            e.message ==
                'Trying to deserialize User got error. '
                    'These keys had `null` values, which is not allowed: [name, age]',),),);
  });

  test(
      'Given Map of user '
      'When map has a name and age '
      'AND name is required AND not allowed null '
      'AND age is required AND not allowed null '
      'Should execute successfully', () async {
    const value = {
      'name': 'Toshi Ossada',
      'age': 14,
    };
    DefaultHelpers.checkKeys(
      value,
      requiredKeys: ['name', 'age'],
      disallowNullValues: ['name', 'age'],
      objName: 'User',
    );
  });
}
