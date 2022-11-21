import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_mobile_engineer/main.dart' as app;

import 'package:integration_test/integration_test.dart';


void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Open app in offline mode first time', (tester) async {
    /*Given*/
    //App is open without any internet connection
    app.main();

    /*When*/
    await tester.pumpAndSettle();

    final dialog = find.byKey(const Key('No_internet_connection_dialog_is_visible'));

    /*Then*/
    expect(dialog, findsOneWidget);
  });
}
