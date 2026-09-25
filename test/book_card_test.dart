import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:appmultiecran/widgets/book_card.dart';
import 'package:appmultiecran/models/book.dart';

void main() {
  testWidgets('BookCard affiche titre et auteur', (WidgetTester tester) async {
    final book = Book(
      id: '1',
      title: 'Sankara le rebelle',
      author: 'Sennen Andriamirado',
      description: 'Biographie',
      year: 1989,
    );

    // Fournir un onTap obligatoire (même vide)
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: BookCard(
          book: book,
          onTap: () {}, // ✅ correction : paramètre requis
        ),
      ),
    ));

    expect(find.text('Sankara le rebelle'), findsOneWidget);
    expect(find.text('Sennen Andriamirado'), findsOneWidget);
  });
}
