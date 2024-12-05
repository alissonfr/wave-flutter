import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wave_flutter/app/core/providers/auth_provider.dart';
import 'package:wave_flutter/app/core/providers/genre_state.dart';
import 'package:wave_flutter/app/core/providers/playlist_state.dart';
import 'package:wave_flutter/app/core/theme/app_theme.dart';
import 'package:wave_flutter/app/modules/home/home_module.dart';
import 'package:wave_flutter/app/modules/library/library_module.dart';
import 'package:wave_flutter/app/modules/search/search_module.dart';
import 'package:wave_flutter/app/shared/details/album_details_module.dart';
import 'package:wave_flutter/app/shared/details/playlist_details_module.dart';
import 'package:wave_flutter/app/shared/playlist/playlist_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PlaylistState()),
        ChangeNotifierProvider(create: (_) => GenreState()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Wave',
      theme: AppTheme.theme,
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) => AppScaffold(child: child),
      routes: [
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: HomeModule()),
          builder: (context, state) => HomeModule(),
        ),
        GoRoute(
          path: '/search',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: SearchModule()),
          builder: (context, state) => SearchModule(),
        ),
        GoRoute(
          path: '/library',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: LibraryModule()),
          builder: (context, state) => LibraryModule(),
        ),
        GoRoute(
          path: '/create-playlist',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: PlaylistModule()),
          builder: (context, state) => PlaylistModule(),
        ),
        GoRoute(
          path: '/album-details/:id',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return AlbumDetailsModule(id: id);
          },
        ),
        GoRoute(
          path: '/playlist-details/:id',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return PlaylistDetailsModule(id: id);
          },
        ),
      ],
    ),
  ],
);

class AppScaffold extends StatelessWidget {
  final Widget child;
  const AppScaffold({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), label: 'Biblioteca'),
        ],
        currentIndex: _getCurrentIndex(context),
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/home');
              break;
            case 1:
              context.go('/search');
              break;
            case 2:
              context.go('/library');
              break;
          }
        },
      ),
    );
  }

  int _getCurrentIndex(BuildContext context) {
    final location =
        GoRouter.of(context).routerDelegate.currentConfiguration.fullPath;
    if (location.startsWith('/search')) return 1;
    if (location.startsWith('/library')) return 2;
    return 0;
  }
}
