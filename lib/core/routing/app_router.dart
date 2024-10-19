import 'package:crm/core/routing/app_routes.dart';
import 'package:crm/features/auth/ui/auth_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    // Arguments to be passed to any screen like this : (arguments as ClassName)
    final arguments = settings.arguments;

    switch (settings.name) {
      case AppRoutes.auth:
        return MaterialPageRoute(
          builder: (_) => const AuthScreen(),
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Home'),
            ),
          ),
        );
      default:
        return null;
    }
  }
}
