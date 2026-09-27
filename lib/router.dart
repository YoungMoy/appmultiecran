import 'package:go_router/go_router.dart';
import 'package:appmultiecran/screens/home_screen.dart';
import 'package:appmultiecran/screens/book_list_screen.dart';
import 'package:appmultiecran/screens/book_detail_screen.dart';
import 'package:appmultiecran/screens/add_book_screen.dart';
import 'package:appmultiecran/screens/settings_screen.dart';

/// Configuration des routes de l’application.
/// Chaque route est documentée pour préciser son rôle et ses paramètres.
GoRouter myRouter(Function(bool) toggleTheme) => GoRouter(
  initialLocation: '/',
  routes: [
    // Route d'accueil
    // Affiche l'écran principal avec navigation (BottomNavigationBar sur mobile, NavigationRail sur tablette).
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),

    //  Route liste des livres
    // Affiche la liste des livres avec recherche et filtrage.
    GoRoute(
      path: '/books',
      builder: (context, state) => const BookListScreen(),
    ),

    // Route détail d’un livre
    // Paramètre attendu : id (String)
    // Exemple : /book/123 → affiche le livre avec id=123
    GoRoute(
      path: '/book/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return BookDetailScreen(id: id);
      },
    ),

    // Route ajout d’un livre
    // Affiche un formulaire avec validation (Titre, Auteur, Année obligatoires).
    GoRoute(
      path: '/add',
      builder: (context, state) => const AddBookScreen(),
    ),

    // Route paramètres
    // Permet de basculer entre thème clair/sombre via ThemeSwitcher.
    GoRoute(
      path: '/settings',
      builder: (context, state) => SettingsScreen(toggleTheme: toggleTheme),
    ),
  ],
);
