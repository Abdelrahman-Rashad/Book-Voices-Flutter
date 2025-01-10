// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:book_voices/api/firebase/auth_helper/auth_helper.dart';
import 'package:book_voices/core/error/failure.dart';

abstract class AuthDataSource {
  Future<User> login(String email, String password);
  Future<User> register(String email, String password);
  Future<void> logout();
}

class AuthDataSourceImpl implements AuthDataSource {
  AuthHelper authHelper;
  AuthDataSourceImpl({
    required this.authHelper,
  });
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
