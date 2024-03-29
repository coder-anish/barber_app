import 'package:cybershop/screens/signin.dart';
import 'package:cybershop/screens/signout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets(
    "testing the widgets",
    (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        routes: {
          '/register': (context) => SignOut(),
        },
        home: const SignIn(),
      ));
      Finder email = find.byKey(const ValueKey("txtEmail"));
      await tester.enterText(email, "testsilwal123@gmail.com");
      Finder password = find.byKey(const ValueKey("txtPassword"));
      await tester.enterText(password, "test12345");
      Finder signup = find.byKey(const ValueKey("btnRegister"));
      await tester.dragUntilVisible(
        signup,
        find.byType(Scaffold),
        const Offset(0, 70),
      );
      await tester.tap(signup);
      await tester.pumpAndSettle();
      expect(find.byType(Scaffold), findsOneWidget);
    },
  );
}
