import 'package:flutter_test/flutter_test.dart';
import 'package:weather_test/modules/core/usecases/check_internet.dart';

void main() {
  test(
      'Given a CheckInternetUsecase '
      'When lookup return a empty List '
      'Then should return false', () async {
    final usecase = CheckInternetUsecase(
      lookup: () async {
        return [];
      },
    );

    final result = await usecase();

    expect(result, isFalse);
  });

  test(
      'Given a CheckInternetUsecase '
      'When lookup return a items '
      'Then should return true', () async {
    final usecase = CheckInternetUsecase(
      lookup: () async {
        return [1];
      },
    );

    final result = await usecase();

    expect(result, isTrue);
  });
}
