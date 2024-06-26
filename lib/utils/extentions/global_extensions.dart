import 'package:flutter/material.dart';

extension WidgetUtilitiesX on Widget {
  /// Transform this widget `x` or `y` pixels.
  Widget nudge({
    double x = 0.0,
    double y = 0.0,
  }) =>
      Transform.translate(
        offset: Offset(x, y),
        child: this,
      );
}
