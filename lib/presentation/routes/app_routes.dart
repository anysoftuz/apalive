import 'package:apalive/presentation/routes/route_name.dart';
import 'package:apalive/presentation/views/academy/academy_view.dart';
import 'package:apalive/presentation/views/auth/auth_view.dart';
import 'package:apalive/presentation/views/blog/blog_view.dart';
import 'package:apalive/presentation/views/common/error_view.dart';
import 'package:apalive/presentation/views/common/splash_view.dart';
import 'package:apalive/presentation/views/forum/forum_view.dart';
import 'package:apalive/presentation/views/graduates/graduates_view.dart';
import 'package:apalive/presentation/views/home/home_view.dart';
import 'package:apalive/presentation/views/library/library_view.dart';
import 'package:apalive/presentation/views/main_view.dart';
import 'package:apalive/presentation/views/meets/meets_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

sealed class AppRouts {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: AppRouteName.splash,
    errorBuilder: (context, state) => const ErrorView(),
    routes: [
      GoRoute(
        path: AppRouteName.errorFound,
        builder: (context, state) => const ErrorView(),
      ),
      GoRoute(
        path: AppRouteName.splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: AppRouteName.auth,
        builder: (context, state) => const AuthView(),
      ),
      mainView,
    ],
  );

  static final mainView = StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return MainView(navigationShell: navigationShell);
    },
    branches: <StatefulShellBranch>[
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRouteName.home,
            builder: (context, state) => const HomeView(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRouteName.academy,
            builder: (context, state) => const AcademyView(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRouteName.graduates,
            builder: (context, state) => const GraduatesView(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRouteName.library,
            builder: (context, state) => const LibraryView(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRouteName.meets,
            builder: (context, state) => const MeetsView(),
          ),
        ],
      ),

      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRouteName.blog,
            builder: (context, state) => const BlogView(),
          ),
        ],
      ),

      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRouteName.forum,
            builder: (context, state) => const ForumView(),
          ),
        ],
      ),
    ],
  );
}
