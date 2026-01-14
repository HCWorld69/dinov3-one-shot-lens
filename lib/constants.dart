/// Constants used throughout the application
class AppConstants {
  static const String modelFilename = 'dinov3_feature_extractor.onnx';
  // Number of frames to skip between processing for speed.
  static const int frameSkipCount = 5;
  static const List<int> inputSizes = [320, 400, 512, 768];
  static const double minThreshold = 0.5;
  static const double maxThreshold = 0.9;
  static const int thresholdDivisions = 8;
}
