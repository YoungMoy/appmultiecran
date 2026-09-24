class Book {
  final String id;
  final String title;
  final String author;
  final String description;
  final int year;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.year,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'description': description,
      'year': year,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'],
      title: map['title'],
      author: map['author'],
      description: map['description'],
      year: map['year'],
    );
  }

  @override
  String toString() {
    return 'Book(id: $id, title: $title, author: $author, year: $year)';
  }
}
