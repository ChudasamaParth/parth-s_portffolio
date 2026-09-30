import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio/main.dart';

void main() {
  testWidgets('portfolio adapts to narrow and wide screens', (tester) async {
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    for (final size in [const Size(320, 800), const Size(1440, 900)]) {
      tester.view.physicalSize = size;
      tester.view.devicePixelRatio = 1;
      await tester.pumpWidget(const MyApp());

      expect(find.text("Hi, I'm Parth Chudasama"), findsOneWidget);
      expect(tester.takeException(), isNull);
    }
  });
}
