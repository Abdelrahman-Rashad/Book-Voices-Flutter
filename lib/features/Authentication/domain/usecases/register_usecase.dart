import 'package:book_voices/features/Authentication/domain/repositories/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/error/failure.dart';

class RegisterUsecase {
  final AuthRepo authRepo;

  RegisterUsecase(this.authRepo);

  Future<Either<Failure, User>> execute(String email, String password) {
    return authRepo.register(email, password);
  }
}