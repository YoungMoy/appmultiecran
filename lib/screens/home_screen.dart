import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<String> _routes = [
    '/books',    // Liste des livres
    '/add',      // Formulaire d’ajout
    '/settings', // Paramètres
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    context.go(_routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    // Responsive : largeur > 600px = tablette/desktop
    final isWide = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      body: Row(
        children: [
          if (isWide)
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: _onItemTapped,
              labelType: NavigationRailLabelType.selected,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.library_books),
                  label: Text('Livres'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.add),
                  label: Text('Ajouter'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings),
                  label: Text('Paramètres'),
                ),
              ],
            ),
          Expanded(
            child: Center(
              child: Text(
                'Bienvenue dans la Bibliothèque \nChoisis un onglet pour commencer',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
        ],
      ),
      // Mobile : BottomNavigationBar
      bottomNavigationBar: isWide
          ? null
          : BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.library_books),
                  label: 'Livres',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  label: 'Ajouter',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Paramètres',
                ),
              ],
            ),
    );
  }
}

