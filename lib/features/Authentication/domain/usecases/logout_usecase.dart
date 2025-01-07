import 'package:book_voices/features/Authentication/domain/repositories/auth_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';

class LogoutUsecase {
  final AuthRepo authRepo;

  LogoutUsecase(this.authRepo);

  Future<Either<Failure, void>> execute() {
    return authRepo.logout();
  }
}
