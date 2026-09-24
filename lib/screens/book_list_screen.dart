import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:appmultiecran/repositories/book_repository.dart';
import 'package:appmultiecran/widgets/book_card.dart';

class BookListScreen extends StatefulWidget {
  const BookListScreen({super.key});

  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  final repo = BookRepository();
  String query = '';

  @override
  Widget build(BuildContext context) {
    // Récupère tous les livres
    final books = repo.getAll();

    // Filtre selon la recherche (titre ou auteur)
    final filteredBooks = query.isEmpty
        ? books
        : books.where((book) {
            return book.title.toLowerCase().contains(query.toLowerCase()) ||
                   book.author.toLowerCase().contains(query.toLowerCase());
          }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Bibliothèque')),
      body: Column(
        children: [
          // Champ de recherche
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Recherche',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (v) => setState(() => query = v),
            ),
          ),
          // Responsive : ListView sur mobile, GridView sur tablette
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 600) {
                  // Tablette/desktop → grille
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 2 colonnes
                      childAspectRatio: 3, // ratio largeur/hauteur
                    ),
                    itemCount: filteredBooks.length,
                    itemBuilder: (context, index) {
                      final book = filteredBooks[index];
                      return BookCard(
                        book: book,
                        onTap: () => context.go('/book/${book.id}'),
                      );
                    },
                  );
                } else {
                  // Mobile → liste
                  return ListView.builder(
                    itemCount: filteredBooks.length,
                    itemBuilder: (context, index) {
                      final book = filteredBooks[index];
                      return BookCard(
                        book: book,
                        onTap: () => context.go('/book/${book.id}'),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

