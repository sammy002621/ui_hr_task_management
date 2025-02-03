// i need something that will return the height and the width of the parent
// so basically it would be a function that return the height and the width of the current parent widget

import 'package:flutter/material.dart';

extension ContextMeasurements on BuildContext {
  double get parentWidth => MediaQuery.of(this).size.width;
  double get parentHeight => MediaQuery.of(this).size.height;
}
