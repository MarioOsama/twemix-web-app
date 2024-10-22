import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crm/core/networking/firebase_auth_factory.dart';
import 'package:crm/core/networking/firebase_auth_services.dart';
import 'package:crm/core/networking/firestore_factory.dart';
import 'package:crm/core/networking/firestore_services.dart';
import 'package:crm/features/auth/data/repos/auth_repo.dart';
import 'package:crm/features/auth/logic/cubit/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupGetIt() {
  // Firebase Firestore instance
  FirebaseFirestore firestore = FirestoreFactory.getFirestoreInstance();
  FirebaseAuth firebaseAuth = FirebaseAuthFactory.getAuthInstance();

  // Firebase Services
  getIt.registerLazySingleton<FirebaseAuthServices>(
      () => FirebaseAuthServices(firebaseAuth));
  getIt.registerLazySingleton<FirestoreServices>(
      () => FirestoreServices(firestore));

  // Repos
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(getIt(), getIt()));

  // Cubits
  getIt.registerLazySingleton<AuthCubit>(() => AuthCubit(getIt()));
}
