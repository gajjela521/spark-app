import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:spark/main.dart';

void main() {
  testWidgets('SparkApp renders SplashScreen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // SparkApp is a ConsumerWidget, so it needs a ProviderScope parent.
    await tester.pumpWidget(const ProviderScope(child: SparkApp()));

    // Verify that the SplashScreen is rendered.
    expect(find.byType(SplashScreen), findsOneWidget);

    // Verify that the "SPARK" text is visible on the screen.
    expect(find.text('SPARK'), findsOneWidget);
    
    // Check if the text is styled inside a Scaffold
    expect(find.byType(Scaffold), findsOneWidget);
  });
}
