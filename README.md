# Projet Flutter — Bibliothèque
Application Flutter multi-écrans avec navigation, réalisée dans le cadre du projet Flutter.

# ![Flutter CI/CD](https://github.com/YoungMoy/appmultiecran/actions/workflows/flutter_ci.yml/badge.svg)

# Objectif du projet
Cette application permet de gérer une petite bibliothèque personnelle.
Elle illustre les concepts fondamentaux de Flutter : navigation multi-écrans, gestion d’état simple, formulaires avec validation, widgets réutilisables, thèmes clair/sombre et responsive design (mobile/tablette).

# Fonctionnalités
✅ 4 écrans distincts :

✅ Home : navigation principale (BottomNavigationBar sur mobile, NavigationRail sur tablette).

✅ Liste des livres : affichage des livres avec recherche/filtrage.

✅ Détail d’un livre : passage de paramètres pour afficher les infos d’un livre.

✅ Formulaire d’ajout : ajout d’un livre avec validation (≥ 3 champs obligatoires).

✅ Paramètres : bascule du thème clair/sombre avec widget réutilisable.

✅ Navigation avec GoRouter (gestion centralisée des routes).

✅ Liste avec recherche/filtrage (TextField qui filtre les résultats).

✅ Détail avec passage de paramètres (affichage dynamique selon le livre sélectionné).

✅ Formulaire avec validation (Titre, Auteur, Année, Description).

✅ Gestion du  theme : clair/sombre avec un widget réutilisable ThemeSwitcher.

✅ Responsive design : BottomNavigationBar sur mobile, NavigationRail sur tablette, ListView sur mobile et GridView sur tablette.

✅ Widgets variés : ListView, GridView, Card, Stack, TextField, BottomNavigationBar, NavigationRail.

✅  Widgets réutilisables

- **BookCard** : affiche les informations d’un livre (titre, auteur, image).
- **CustomButton** : bouton personnalisé réutilisable dans plusieurs écrans.
- **ThemeSwitcher** : permet d’activer/désactiver le mode sombre.


✅ Séparation UI/données via BookRepository.

## Utilisation

- **Accueil (Home)**  
  - Point d’entrée principal de l’application.  
  - Sur **mobile** : navigation via un **BottomNavigationBar**.  
  - Sur **tablette** : navigation via un **NavigationRail**.  
  - Permet de basculer rapidement entre les différents écrans (Liste, Ajout, Paramètres).  

- **Liste des livres**  
  - Affiche tous les livres disponibles dans la bibliothèque.  
  - Inclut un champ de recherche (`TextField`) pour filtrer les résultats en temps réel.  
  - Sur **mobile** : affichage en **ListView**.  
  - Sur **tablette** : affichage en **GridView** pour une meilleure lisibilité.  

- **Détail d’un livre**  
  - Affiche les informations complètes d’un livre sélectionné : **titre, auteur, année, description**.  
  - Utilise le passage de paramètres pour afficher dynamiquement les données du livre choisi.  
  - Permet de consulter les détails sans quitter l’application.  

- **Formulaire d’ajout**  
  - Permet d’ajouter un nouveau livre à la bibliothèque.  
  - Validation obligatoire sur au moins 3 champs : **Titre, Auteur, Année**.  
  - Champ optionnel : **Description** pour enrichir les informations.  
  - Utilise un bouton personnalisé (**CustomButton**) pour valider l’ajout.  
  - Empêche l’enregistrement si les champs obligatoires ne sont pas remplis.  

- **Paramètres**  
  - Permet de basculer entre le **thème clair** et le **thème sombre**.  
  - Utilise un widget réutilisable (**ThemeSwitcher**) pour gérer le changement de thème.  
  - Le choix est appliqué à toute l’application et améliore l’expérience utilisateur.

# Structure du projet

lib/
├── main.dart                 # Point d’entrée de l’application
├── router.dart               # Gestion des routes avec GoRouter
│
├── models/
│   └── book.dart             # Classe Book (titre, auteur, année, description)
│
├── repositories/
│   └── book_repository.dart  # Gestion des données (liste des livres)
│
├── screens/
│   ├── home_screen.dart        # Écran principal avec navigation responsive
│   ├── book_list_screen.dart   # Liste des livres avec recherche/filtrage
│   ├── book_detail_screen.dart # Détail d’un livre (paramètres dynamiques)
│   ├── add_book_screen.dart    # Formulaire d’ajout avec validation (≥ 3 champs)
│   └── settings_screen.dart    # Paramètres avec ThemeSwitcher (clair/sombre)
│
└── widgets/
    ├── book_card.dart          # Widget réutilisable pour afficher un livre
    ├── custom_button.dart      # Widget réutilisable pour les boutons
    └── theme_switcher.dart     # Widget réutilisable pour le thème
test/
│   ├── book_repository_test.dart
│   ├── book_card_test.dart
│   ├── add_book_screen_test.dart
│   ├── navigation_test.dart
│   └── book_detail_screen_test.dart    

# Fichiers et dossiers à la racine du projet
README.md                      # Documentation du projet (description, instructions, captures)

pubspec.yaml                   # Dépendances et configuration du projet Flutter

pubspec.lock                   # Versions figées des dépendances

analysis_options.yaml           # Règles de linting et d'analyse du code (optionnel)

android/                       # Code spécifique Android (auto-généré par Flutter)

ios/                           # Code spécifique iOS (auto-généré par Flutter)

web/                           # Support Web (si activé)

# Prérequis
- Flutter SDK (≥ 3.0)
- Android Studio ou VS Code avec extensions Flutter/Dart
- Un émulateur Android ou un appareil physique connecté

# installation et lancement

1. Cloner le projet :
   ```bash
   git clone https://github.com/YoungMoy/appmultiecran.git
   cd appmultiecran

2- Installer les dependances :
flutter pub get

3- Lancer l'application :
flutter run

# Captures d’écran

# Écran d’accueil
![Home Screen](captures/home.png)

# Liste des livres
![Book List](captures/book_list.png)

# Formulaire d’ajout
![Add Book Screen](captures/add_book.png)

# Paramètres
![Settings Screen](captures/settings.png)


# Tests réalisés
✅ Testé sur émulateur Android (Pixel 5, API 33).

✅ Testé sur téléphone physique (Android 12).

✅ Navigation, recherche, formulaire et thème fonctionnent correctement.

✅ Responsive validé (NavigationRail sur tablette, GridView sur tablette).

# Intégration Continue / Déploiement Continu (CI/CD)

Ce projet utilise **GitHub Actions** pour automatiser les étapes suivantes :
- Analyse du code (`flutter analyze`)
- Exécution des tests unitaires avec couverture (`flutter test --coverage`)
- Génération des builds (APK Android et Web)
- Publication des artefacts (APK et build Web)

Le pipeline est défini dans le fichier : .github/workflows/flutter_ci.yml

Grâce à ce pipeline :
- Chaque `git push` déclenche automatiquement les tests et la compilation.
- Les erreurs sont détectées rapidement, améliorant la **fiabilité** du projet.
- Les builds sont générés sans intervention manuelle, augmentant l’**efficacité**.


# Auteur
Projet réalisé dans le cadre du programme Flutter (Flutterfire Summer Camp).