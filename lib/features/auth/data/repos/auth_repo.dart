import 'package:crm/core/networking/firebase_auth_services.dart';
import 'package:crm/core/networking/firestore_services.dart';
import 'package:crm/features/auth/data/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  final FirestoreServices _firestoreServices;
  final FirebaseAuthServices _firebaseAuthServices;

  AuthRepo(this._firestoreServices, this._firebaseAuthServices);

  /// Logs in a user using their email and password.
  ///
  /// This method attempts to authenticate the user with the provided email and
  /// password using Firebase authentication services. If the authentication is
  /// successful, it retrieves the user's type and name from the database and
  /// constructs a [UserModel] object. If any step fails, it returns an [Exception].
  ///
  /// Returns:
  /// - A [Future] that completes with an [Either] containing:
  ///   - [Right] with a [UserModel] if the login and data retrieval are successful.
  ///   - [Left] with an [Exception] if any step fails.
  ///
  /// Parameters:
  /// - `email`: The email address of the user.
  /// - `password`: The password of the user.
  Future<Either<Exception, UserModel>> login(
      String email, String password) async {
    final authUser =
        await _firebaseAuthServices.loginUsingEmailAndPassword(email, password);
    return authUser.fold(
      (firebaseAuthException) => Left(firebaseAuthException),
      (user) async => await getUser(user, email, password),
    );
  }

  /// Retrieves the user data from the database and constructs a [UserModel].
  ///
  /// Takes a [User] object, an email, and a password as parameters.
  /// It fetches the user data using the user's UID and constructs a [UserModel]
  /// with the retrieved data.
  ///
  /// Returns a [Future] that completes with either a [FirebaseException]
  /// if an error occurs, or a [UserModel] if the operation is successful.
  ///
  /// Parameters:
  /// - [user]: The [User] object containing the user's UID.
  /// - [email]: The email address of the user.
  /// - [password]: The password of the user.
  ///
  /// Returns:
  /// - A [Future] that completes with an [Either] containing a [FirebaseException]
  ///   on failure or a [UserModel] on success.
  Future<Either<FirebaseException, UserModel>> getUser(
      User user, String email, String password) async {
    final userData = await getUserData(user.uid);
    return userData.fold(
      (firebaseException) => Left(firebaseException),
      (userData) => Right(_constructUserModel(
          user.uid, email, password, userData['name'], userData['type'])),
    );
  }

  UserModel _constructUserModel(String id, String email, String password,
      String userName, String userTypeString) {
    return UserModel(
      id: id,
      email: email,
      password: password,
      name: userName,
      userType:
          UserType.values.firstWhere((value) => value.name == userTypeString),
    );
  }

  Future<Either<FirebaseException, Map<String, dynamic>>> getUserData(
      String uId) async {
    return await _firestoreServices.getUserData(uId);
  }
}
