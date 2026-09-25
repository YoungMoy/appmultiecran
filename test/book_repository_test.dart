import 'package:flutter_test/flutter_test.dart';
import 'package:appmultiecran/repositories/book_repository.dart';
import 'package:appmultiecran/models/book.dart';

void main() {
  group('BookRepository', () {
    test('getById retourne un livre existant', () {
      final repo = BookRepository();
      final book = repo.getById('1');
      expect(book, isNotNull);
      expect(book!.title, 'Sankara le rebelle');
    });

    test('getById retourne null si ID inexistant', () {
      final repo = BookRepository();
      final book = repo.getById('999');
      expect(book, isNull);
    });

    test('search trouve par titre ou auteur', () {
      final repo = BookRepository();
      final results = repo.search('Sankara');
      expect(results.isNotEmpty, true);
      expect(results.first.title, contains('Sankara'));
    });

    test('addBook ajoute un nouveau livre', () {
      final repo = BookRepository();
      final initialCount = repo.getAll().length;

      final newBook = Book(
        id: '100',
        title: 'Test Driven Development',
        author: 'Kent Beck',
        description: 'Livre sur les tests unitaires',
        year: 2002,
      );

      repo.addBook(newBook);

      expect(repo.getAll().length, initialCount + 1);
      expect(repo.getById('100')?.title, 'Test Driven Development');
    });
  });
}
