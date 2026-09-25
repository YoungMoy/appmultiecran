import 'package:flutter/material.dart';
import 'package:appmultiecran/repositories/book_repository.dart';

class BookDetailScreen extends StatelessWidget {
  final String id;
  const BookDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final repo = BookRepository();
    final book = repo.getById(id);

    if (book == null) {
      return const Scaffold(
        body: Center(child: Text('Livre introuvable')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Auteur : ${book.author}', style: const TextStyle(fontSize: 18)),
            Text('Année : ${book.year}'),
            const SizedBox(height: 16),
            Text(
              book.description,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
