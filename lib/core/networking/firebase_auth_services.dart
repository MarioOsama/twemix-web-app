import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  final FirebaseAuth _auth;

  FirebaseAuthServices(this._auth);

  Future<Either<FirebaseAuthException, User>> loginUsingEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      userCredential.user!.updateDisplayName('Mario Osama');
      return Right(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      return Left(e);
    }
  }
}
