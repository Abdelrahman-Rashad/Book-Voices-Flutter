import 'package:book_voices/api/firebase/auth_helper/auth_helper.dart';
import 'package:book_voices/core/error/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDataSource {
  Future<User> login(String email, String password);
  Future<User> register(String email, String password);
  Future<void> logout();
}

class AuthDataSourceImpl implements AuthDataSource {
  AuthHelper authHelper = AuthHelper(FirebaseAuth.instance);
  @override
  Future<User> login(String email, String password) async {
    try {
      return await authHelper.signInWithEmailAndPassword(
          email: email, password: password);
    } on ServerFailure {
      rethrow;
    }
  }

  @override
  Future<User> register(String email, String password) async {
    try {
      return await authHelper.registerWithEmailAndPassword(
          email: email, password: password);
    } on ServerFailure {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    await authHelper.signOut();
  }
}
