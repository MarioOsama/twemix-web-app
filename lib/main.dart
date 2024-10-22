import 'package:crm/core/di/dependency_injection.dart';
import 'package:crm/core/routing/app_router.dart';
import 'package:crm/crm_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDM4a2hijJAqrIcYh-qCk-zVRb0J9G9AYo",
        authDomain: "twemix-system.firebaseapp.com",
        projectId: "twemix-system",
        storageBucket: "twemix-system.appspot.com",
        messagingSenderId: "958528035302",
        appId: "1:958528035302:web:d8acc1c67e3f48b3361e27"),
  );

  // Dependencies Injection
  setupGetIt();
  runApp(
    CRMApp(
      appRouter: AppRouter(),
    ),
  );
}
