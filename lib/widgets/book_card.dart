import 'package:flutter/material.dart';
import 'package:appmultiecran/models/book.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final VoidCallback onTap;

  const BookCard({super.key, required this.book, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(book.title),
        subtitle: Text(book.author),
        onTap: onTap,
      ),
    );
  }
}
