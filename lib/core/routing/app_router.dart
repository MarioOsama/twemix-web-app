import 'package:crm/core/di/dependency_injection.dart';
import 'package:crm/core/routing/app_routes.dart';
import 'package:crm/features/auth/logic/cubit/auth_cubit.dart';
import 'package:crm/features/auth/ui/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    // Arguments to be passed to any screen like this : (arguments as ClassName)
    final arguments = settings.arguments;

    switch (settings.name) {
      case AppRoutes.auth:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AuthCubit>(
            create: (context) => getIt<AuthCubit>(),
            child: const AuthScreen(),
          ),
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
