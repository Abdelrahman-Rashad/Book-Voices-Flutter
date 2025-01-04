import 'package:book_voices/core/error/failure.dart';
import 'package:book_voices/features/Authentication/data/datasources/auth_data_source.dart';
import 'package:book_voices/features/Authentication/domain/repositories/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthDataSource authDataSource;

  AuthRepoImpl(this.authDataSource);
  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      return Right(await authDataSource.login(email, password));
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      return Right(await authDataSource.logout());
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, User>> register(String email, String password) async {
    try {
      return Right(await authDataSource.register(email, password));
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }
}
