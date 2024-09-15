import 'package:bookly_app/core/routing/routes.dart';
import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_view.dart';
import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: Routes.details,
        builder: (context, state) => BookDetailsView(
          bookEntity: state.extra as BookEntity,
        ),
      ),
      GoRoute(
        path: Routes.search,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
