import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pocket_task/core/utils/colour_utils.dart';

void main() {
  test('ColourUtils constants should match expected Color values', () {
    expect(ColourUtils.BLACK_COLOR, const Color(0xFF1F1F1F));
    expect(ColourUtils.BLACK54, Colors.black54);
  });
}
