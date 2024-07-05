import 'package:andregarcia_kalshi/core/sizer.dart';

extension SizerExtensions on double {
  double get w => Sizer.getWidth(this);
  double get h => Sizer.getHeight(this);
}
