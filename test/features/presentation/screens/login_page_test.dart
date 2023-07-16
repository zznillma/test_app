import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/features/auth/presentation/screens/login_page/login_page.dart';
import 'package:test_app/internal/dependencies/get_it.dart';

import '../../wrapper.dart';

void main() {
  configureDependencies();
  testWidgets('Auth', (WidgetTester tester) async {
    await tester.pumpWidget(wrapApp(LoginPage()));
    await tester.pump();

    expect(find.byType(LoginPage), findsOneWidget);
    expect(find.text('Login Page'), findsOneWidget);
    expect(find.text('Email:'), findsOneWidget);
    expect(find.text('Password:'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));

    await tester.enterText(find.byKey(const Key('first')), 'test@example.com');
    await tester.enterText(find.byKey(const Key('second')), 'password');

    await tester.tap(find.byType(ElevatedButton));
  });
}


