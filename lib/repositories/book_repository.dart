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

  /// Retourne tous les livres
  List<Book> getAll() => _books;

  /// Retourne un livre par son ID, ou null si non trouvé
  Book? getById(String id) {
    try {
      return _books.firstWhere((b) => b.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Nouvelle méthode pour ajouter un livre
  void addBook(Book book) {
    _books.add(book);
  }

  /// Recherche améliorée : par titre ou auteur
  List<Book> search(String query) {
    final lowerQuery = query.toLowerCase();
    return _books.where((b) =>
      b.title.toLowerCase().contains(lowerQuery) ||
      b.author.toLowerCase().contains(lowerQuery)
    ).toList();
  }
}
