import 'package:crm/core/routing/app_router.dart';
import 'package:crm/core/routing/app_routes.dart';
import 'package:flutter/material.dart';

class CRMApp extends StatelessWidget {
  const CRMApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRM App',
      initialRoute: AppRoutes.auth,
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
