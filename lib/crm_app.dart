import 'package:crm/core/routing/app_router.dart';
import 'package:crm/core/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CRMApp extends StatelessWidget {
  const CRMApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 1024),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CRM App',
        initialRoute: AppRoutes.auth,
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
