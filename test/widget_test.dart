import 'package:flutter_test/flutter_test.dart';
import 'package:dinov3_one_shot_lens/constants.dart';

void main() {
  test('AppConstants are configured', () {
    expect(AppConstants.modelFilename, isNotEmpty);
    expect(AppConstants.frameSkipCount, greaterThan(0));
    expect(AppConstants.inputSizes, isNotEmpty);
    expect(AppConstants.minThreshold, lessThan(AppConstants.maxThreshold));
  });
}
