import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crm/features/auth/data/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreServices {
  final FirebaseFirestore _firestore;

  FirestoreServices(this._firestore);

  Future<Either<FirebaseException, bool>> registerNewUser(
    String uId,
    UserType userType,
  ) {
    try {
      _firestore.collection('users').doc(uId).set({
        'userType': userType.name,
      });
      return Future.value(const Right(true));
    } on FirebaseException catch (e) {
      if (e.code == 'already-exists') {
        return Future.value(const Right(false));
      }
      return Future.value(Left(e));
    }
  }

  Future<Either<FirebaseException, Map<String, dynamic>>> getUserData(
      String uId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await _firestore.collection('users').doc(uId).get();
      if (documentSnapshot.data() == null) {
        return Left(FirebaseException(
            code: 'user-not-found', plugin: 'cloud_firestore'));
      }
      return Right(documentSnapshot.data()!);
    } on FirebaseException catch (e) {
      return Left(e);
    }
  }
}
