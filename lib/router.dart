import 'package:go_router/go_router.dart';

import 'package:appmultiecran/screens/home_screen.dart';
import 'package:appmultiecran/screens/book_list_screen.dart';
import 'package:appmultiecran/screens/book_detail_screen.dart';
import 'package:appmultiecran/screens/add_book_screen.dart';
import 'package:appmultiecran/screens/settings_screen.dart';

GoRouter myRouter(Function(bool) toggleTheme) => GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/books',
      builder: (context, state) => const BookListScreen(),
    ),
    GoRoute(
      path: '/book/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return BookDetailScreen(id: id);
      },
    ),
    GoRoute(
      path: '/add',
      builder: (context, state) => const AddBookScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => SettingsScreen(toggleTheme: toggleTheme),
    ),
  ],
);
