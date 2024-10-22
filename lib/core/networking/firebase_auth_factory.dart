import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthFactory {
  FirebaseAuthFactory._();

  static FirebaseAuth? firebaseAuth;

  static FirebaseAuth getAuthInstance() {
    firebaseAuth ??= FirebaseAuth.instance;
    return firebaseAuth!;
  }
}
