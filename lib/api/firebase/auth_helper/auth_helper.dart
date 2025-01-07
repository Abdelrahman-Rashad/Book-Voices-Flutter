import 'package:book_voices/core/error/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../handle_exceptions/handleFirebaseAuthException.dart';

class AuthHelper {
  final FirebaseAuth firebaseAuth;

  AuthHelper(this.firebaseAuth);

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential user = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return user.user!;
    } on FirebaseAuthException catch (e) {
      throw (ServerFailure(
          handleFirebaseAuthException.signInHandleFirebaseAuthException(e)));
    }
  }

  Future<User> registerWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential user = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return user.user!;
    } on FirebaseAuthException catch (e) {
      throw (ServerFailure(
          handleFirebaseAuthException.registerhandleFirebaseAuthException(e)));
    }
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
