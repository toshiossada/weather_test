import 'package:flutter_test/flutter_test.dart';
import 'package:weather_test/modules/core/extensions/diacritics_extension.dart';

void main() {
  test(
      'Given called withoutDiacriticalMarks '
      'When value é João '
      'Should remove Diacritical marks and retoyrn Joao', () async {
    const value = 'João';

    expect(value.withoutDiacriticalMarks, 'Joao');
  });

  test(
      'Given called withoutDiacriticalMarks '
      'When value é JoÃo '
      'Should remove Diacritical marks and retoyrn JoAo', () async {
    const value = 'JoÃo';

    expect(value.withoutDiacriticalMarks, 'JoAo');
  });

  test(
      'Given called withoutDiacriticalMarks '
      'When value é São PÀúlô '
      'Should remove Diacritical marks and retoyrn Sao PAulo', () async {
    const value = 'São PÀúlô';

    expect(value.withoutDiacriticalMarks, 'Sao PAulo');
  });
}
