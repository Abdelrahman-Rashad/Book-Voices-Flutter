import 'package:book_voices/core/error/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../handle_exceptions/handleFirebaseAuthException.dart';

class AuthHelper {
  static Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return user.user!;
    } on FirebaseAuthException catch (e) {
      throw (ServerFailure(
          handleFirebaseAuthException.signInHandleFirebaseAuthException(e)));
    }
  }

  static Future<User> registerWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return user.user!;
    } on FirebaseAuthException catch (e) {
      throw (ServerFailure(
          handleFirebaseAuthException.registerhandleFirebaseAuthException(e)));
    }
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
