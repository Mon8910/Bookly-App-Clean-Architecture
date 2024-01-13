import 'package:bookly_app/Features/home/presentation/view/book_details_view.dart';
import 'package:bookly_app/Features/home/presentation/view/home_view.dart';
import 'package:bookly_app/Features/search/presentation/views/search_view.dart';
import 'package:bookly_app/Features/splash/prsesntation/view/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeview';
  static const kBookDetails = '/bookdetails';
  static const kSearch = '/search';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kSearch,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetails,
        builder: (context, state) => const BookDetailsView(),
      ),
    ],
  );
}
