import 'package:appmultiecran/models/book.dart';

class BookRepository {
  final List<Book> _books = [
    Book(
      id: '1',
      title: 'Sankara le rebelle',
      author: 'Sennen Andriamirado',
      description: 'Biographie et témoignage sur Thomas Sankara',
      year: 1989,
    ),
    Book(
      id: '2',
      title: 'Le Livre vert',
      author: 'Muammar Khadafi',
      description: 'Essai politique et idéologique',
      year: 1975,
    ),
    Book(
      id: '3',
      title: 'L’unité culturelle de l’Afrique noire',
      author: 'Cheikh Anta Diop',
      description: 'Étude sur le patriarcat et le matriarcat dans l’Antiquité',
      year: 1959,
    ),
  ];

  List<Book> getAll() => _books;

  Book? getById(String id) {
    try {
      return _books.firstWhere((b) => b.id == id);
    } catch (e) {
      return null;
    }
  }

  List<Book> search(String query) =>
      _books.where((b) => b.title.toLowerCase().contains(query.toLowerCase())).toList();
}
