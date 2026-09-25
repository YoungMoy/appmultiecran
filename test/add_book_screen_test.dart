import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:appmultiecran/screens/add_book_screen.dart';

void main() {
  testWidgets('AddBookScreen valide le formulaire', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: AddBookScreen()));

    // Remplir les champs
    await tester.enterText(find.byType(TextFormField).at(0), 'Titre Test');
    await tester.enterText(find.byType(TextFormField).at(1), 'Auteur Test');
    await tester.enterText(find.byType(TextFormField).at(2), '2020');
    await tester.enterText(find.byType(TextFormField).at(3), 'Description Test');

    // Soumettre
    await tester.tap(find.text('Enregistrer'));
    await tester.pump();

    // Vérifier SnackBar
    expect(find.textContaining('ajouté avec succès'), findsOneWidget);
  });
}
