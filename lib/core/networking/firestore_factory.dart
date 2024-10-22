import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreFactory {
  FirestoreFactory._();

  static FirebaseFirestore? firestore;

  static FirebaseFirestore getFirestoreInstance() {
    firestore ??= FirebaseFirestore.instance;
    return firestore!;
  }
}
