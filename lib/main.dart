import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wave_flutter/app/core/theme/app_theme.dart';
import 'package:wave_flutter/app/modules/home/home_module.dart';
import 'package:wave_flutter/app/modules/library/library_module.dart';
import 'package:wave_flutter/app/modules/search/search_module.dart';
import 'package:wave_flutter/app/shared/pages/details/details_module.dart';

void main() {
  runApp(MyApp());
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
          path: '/details/:id',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return DetailsModule(id: id);
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
