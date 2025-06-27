import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:pocket_task/core/utils/utils.dart';

void main() {
  test('formatDate formats input date string correctly', () {
    final input = '2025-06-27T14:45:00';
    final expected = DateFormat('hh:mm a, EEEE d MMMM, y')
        .format(DateTime.parse(input));

    final result = formatDate(input);

    expect(result, expected);
  });

  test('formatDate throws FormatException on invalid input', () {
    expect(() => formatDate('invalid-date'), throwsFormatException);
  });
}
