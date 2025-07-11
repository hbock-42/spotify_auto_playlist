import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_auto_playlist/features/auth/presentation/states/auth_state.dart';

import '../../features/auth/presentation/providers/auth_providers.dart';
import '../../features/auth/presentation/screens/auth_screen.dart';
import '../../features/home/presentation/screens/dashboard_screen.dart';
import '../../features/home/presentation/screens/demo_screen.dart';
import '../../features/home/presentation/screens/welcome_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authNotifierProvider);

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final isAuthenticated = authState.map(
        authenticated: (_) => true,
        initial: (_) => false,
        loading: (_) => false,
        unauthenticated: (_) => false,
        error: (_) => false,
      );

      // If user is authenticated and trying to access auth page, redirect to dashboard
      if (isAuthenticated && state.matchedLocation == '/auth') {
        return '/dashboard';
      }

      // If user is not authenticated and trying to access protected routes, redirect to auth
      if (!isAuthenticated && state.matchedLocation == '/dashboard') {
        return '/auth';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: '/demo',
        builder: (context, state) => const DemoScreen(),
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthScreen(),
      ),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardScreen(),
      ),
    ],
  );
});
