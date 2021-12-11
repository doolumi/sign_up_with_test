import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

double getOpacity(WidgetTester tester, Finder finder) {
  return tester
      .widget<AnimatedOpacity>(
    find.ancestor(
      of: finder,
      matching: find.byType(AnimatedOpacity),
    ),
  )
      .opacity;
}
