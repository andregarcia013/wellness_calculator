class Sizer {
  static double refHeight = 745;
  static double refWidth = 320;

  static double currentWidth = 320;
  static double currentHeight = 745;

  static double getHeight(num refVal) {
    return _calculateRefValues(currentHeight, refHeight, refVal);
  }

  static double getWidth(num refVal) {
    return _calculateRefValues(currentWidth, refWidth, refVal);
  }

  static double _calculateRefValues(double numerator, num denom, num refVal) {
    return numerator / (denom / refVal);
  }
}
