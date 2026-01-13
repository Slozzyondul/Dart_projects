import 'package:devotional/src/features/about/about_page.dart';
import 'package:devotional/src/features/contact/contact_page.dart';
import 'package:devotional/src/features/daily_quotes/quotes_page.dart';
import 'package:devotional/src/features/gallery/gallery_page.dart';
import 'package:devotional/src/features/home/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  home,
  about,
  contact,
  gallery,
  quotes;

  String get path {
    if (this == AppRoute.home) return '/';
    if (this == AppRoute.about) return '/about';
    if (this == AppRoute.contact) return '/contact';
    if (this == AppRoute.gallery) return '/gallery';
    if (this == AppRoute.quotes) return '/quotes';
    return '/';
  }
}

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomePage()),
      GoRoute(path: '/about', builder: (context, state) => const AboutPage()),
      GoRoute(
        path: '/contact',
        builder: (context, state) => const ContactPage(),
      ),
      GoRoute(
        path: '/gallery',
        builder: (context, state) => const GalleryPage(),
      ),
      GoRoute(path: '/quotes', builder: (context, state) => const QuotesPage()),
    ],
  );
});
