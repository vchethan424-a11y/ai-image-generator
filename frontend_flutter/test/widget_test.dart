import 'package:flutter_test/flutter_test.dart';

import 'package:frontend_flutter/main.dart';

void main() {

  testWidgets(
    'App loads successfully',
    (WidgetTester tester) async {

      // ============================================
      // LOAD APP
      // ============================================

      await tester.pumpWidget(
        const MyApp(
          isLoggedIn: false,
        ),
      );

      // ============================================
      // VERIFY LOGIN SCREEN
      // ============================================

      expect(
        find.text(
          'AI Image Generator',
        ),
        findsOneWidget,
      );

      expect(
        find.text(
          'Login',
        ),
        findsOneWidget,
      );
    },
  );
}