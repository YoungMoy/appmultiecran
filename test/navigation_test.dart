import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('NavigationRail affiche les destinations', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: NavigationRail(
          destinations: const [
            NavigationRailDestination(icon: Icon(Icons.home), label: Text('Accueil')),
            NavigationRailDestination(icon: Icon(Icons.book), label: Text('Livres')),
          ],
          selectedIndex: 0,
        ),
      ),
    ));

    expect(find.text('Accueil'), findsOneWidget);
    expect(find.text('Livres'), findsOneWidget);
  });
}
