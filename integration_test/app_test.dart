import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:stand/components/carCard.dart';
import 'package:stand/main.dart' as app;

void main() {
  group('App Test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets("Login and search for Carocha", (tester) async{
      app.main();
      await tester.pumpAndSettle(); // Wait for app to load

      // Get Widgets
      final usernameFormField = find.byKey(Key("usernameFormField"));
      final passwordFormField = find.byKey(Key("passwordFormField"));
      final loginButton = find.byType(RaisedButton).first;

      // Fill data
      await tester.enterText(usernameFormField, "joao");
      await tester.enterText(passwordFormField, "123");
      await tester.pumpAndSettle();

      // Login
      await tester.tap(loginButton);
      await tester.pumpAndSettle();
      await Future.delayed(new Duration(milliseconds: 1000));

      // Click on cars list
      final carsMenu = find.byKey(Key("cars")).first;
      await tester.tap(carsMenu);
      await tester.pumpAndSettle();

      // Filter for Carocha with License Plate 12-AB-34
      final filter = find.byKey(Key("filter"));
      await tester.enterText(filter, "12-AB-34");
      await tester.pumpAndSettle();
      final carochaCard = find.byType(CarCard).first;

      // Tap on Carocha
      await tester.tap(carochaCard);
      await tester.pumpAndSettle();

      // Logout
      final logoutButton = find.byKey(Key("logoutButton"));
      await tester.tap(logoutButton);
      await tester.pumpAndSettle();
      final confirmLogout = find.byKey(Key("logoutDialogAction"));
      await tester.tap(confirmLogout);
      await tester.pumpAndSettle();

    });

  });
}