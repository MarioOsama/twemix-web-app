import 'package:crm/core/routing/app_router.dart';
import 'package:crm/crm_app.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    CRMApp(
      appRouter: AppRouter(),
    ),
  );
}
