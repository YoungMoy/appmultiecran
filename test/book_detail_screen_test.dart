import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:appmultiecran/screens/book_detail_screen.dart';
import 'package:appmultiecran/repositories/book_repository.dart';
import 'package:appmultiecran/models/book.dart';

void main() {
  testWidgets('BookDetailScreen affiche titre, auteur, année et description',
      (WidgetTester tester) async {
    // Préparer un livre de test
    final repo = BookRepository();
    final testBook = Book(
      id: '999',
      title: 'Test Book',
      author: 'Test Author',
      description: 'Ceci est une description de test',
      year: 2021,
    );
    repo.addBook(testBook);

    // Afficher l'écran avec l'ID du livre
    await tester.pumpWidget(MaterialApp(
      home: BookDetailScreen(id: '999'),
    ));

    // Vérifier que toutes les infos sont présentes
    expect(find.text('Test Book'), findsOneWidget);
    expect(find.text('Auteur : Test Author'), findsOneWidget);
    expect(find.text('Année : 2021'), findsOneWidget);
    expect(find.text('Ceci est une description de test'), findsOneWidget);
  });

  testWidgets('BookDetailScreen affiche "Livre introuvable" si ID inexistant',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: BookDetailScreen(id: 'inexistant'),
    ));

    expect(find.text('Livre introuvable'), findsOneWidget);
  });
}
