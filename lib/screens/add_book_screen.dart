import 'package:flutter/material.dart';
import 'package:appmultiecran/widgets/custom_button.dart';
import 'package:appmultiecran/repositories/book_repository.dart';
import 'package:appmultiecran/models/book.dart';

class AddBookScreen extends StatefulWidget {
  const AddBookScreen({super.key});

  @override
  State<AddBookScreen> createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String author = '';
  String year = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajouter un livre')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Titre'),
                onSaved: (v) => title = v!,
                validator: (v) =>
                    v == null || v.isEmpty ? 'Titre obligatoire' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Auteur'),
                onSaved: (v) => author = v!,
                validator: (v) =>
                    v == null || v.isEmpty ? 'Auteur obligatoire' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Année'),
                keyboardType: TextInputType.number,
                onSaved: (v) => year = v!,
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Année obligatoire';
                  if (int.tryParse(v) == null) return 'Année invalide';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
                onSaved: (v) => description = v!,
                validator: (v) =>
                    v == null || v.isEmpty ? 'Description obligatoire' : null,
              ),
              const SizedBox(height: 20),
              // Utilisation du widget réutilisable CustomButton
              CustomButton(
                label: "Enregistrer",
                icon: Icons.save,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    // Création du nouvel objet Book
                    final newBook = Book(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      title: title,
                      author: author,
                      year: int.parse(year),
                      description: description,
                    );

                    // Ajout dans le dépôt
                    BookRepository().addBook(newBook);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Livre "$title" ajouté avec succès !',
                        ),
                      ),
                    );

                    Navigator.pop(context); // Retour à la liste
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
