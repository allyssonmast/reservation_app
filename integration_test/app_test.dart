import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_mobile_engineer/main.dart' as app;

import 'package:integration_test/integration_test.dart';

void main() {
  setUpAll(() {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  });

  testWidgets('Open app in offline mode first time', (tester) async {
    /*Given*/
    //App is open without any internet connection
    app.main();

    /*When*/
    await tester.pumpAndSettle();

    final dialog =
        find.byKey(const Key('No_internet_connection_dialog_is_visible'));

    /*Then*/
    expect(dialog, findsOneWidget);
  });

  testWidgets('Open app in offline mode in cache mode', (tester) async {
    /*Given*/
    //App is opened after data was presented at least once
    app.main();

    /*When*/
    await tester.pumpAndSettle();

    final dialog = find.byKey(const Key('List_of_tables_is_visible'));

    /*Then*/
    expect(dialog, findsOneWidget);
  });

  testWidgets('Table reservation', (tester) async {
    /*Given*/
    //App is opened after data was presented at least once
    app.main();

    /*When*/
    await tester.pumpAndSettle();

    var freeString = find.text('Free').first;

    await tester.tap(freeString);
    await tester.pumpAndSettle();

    /*Then*/
    var customerScreen = find.byKey(const Key('Screen_with_users_tables'));
    expect(customerScreen, findsOneWidget);

    /*When*/
    var customer = find.byType(ListTile).first;
    await tester.tap(customer);
    await tester.pumpAndSettle();
    var tableScreen = find.byKey(const Key('Screen_with_tables'));
    await tester.pumpAndSettle();
    /*Then*/
    expect(tableScreen, findsOneWidget);
  });
  testWidgets('Table reservation cancellation', (tester) async {
    /*Given*/
    //App is opened after data was presented at least once
    app.main();

    /*When*/
    await tester.pumpAndSettle();

    var freeString = find.byType(ListTile).first;

    await tester.tap(freeString);
    await tester.pumpAndSettle();

    /*Then*/
    var customerScreen = find.byType(AlertDialog);
    expect(customerScreen, findsOneWidget);

    /*When*/
    var customer = find.byType(TextButton).first;
    await tester.tap(customer);
    await tester.pumpAndSettle();
    var tableScreen = find.byKey(const Key('Screen_with_tables'));
    await tester.pumpAndSettle();
    /*Then*/
    expect(tableScreen, findsOneWidget);
  });

  testWidgets('Reserved table visual feedback', (tester) async {
    /*Given*/
    //App is open
    app.main();

    /*When*/
    await tester.pumpAndSettle();

    var customerImage = find.byKey(const Key('customer_image')).first;
    var customerName = find.byKey(const Key('customer_name')).first;
    await tester.pumpAndSettle();

    /*Then*/
    expect(customerImage, findsOneWidget);
    expect(customerName, findsOneWidget);
  });
}
