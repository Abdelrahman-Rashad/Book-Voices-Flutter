import 'package:bloc_test/bloc_test.dart';
import 'package:book_voices/core/error/failure.dart';
import 'package:book_voices/features/Authentication/domain/usecases/login_usecase.dart';
import 'package:book_voices/features/Authentication/domain/usecases/logout_usecase.dart';
import 'package:book_voices/features/Authentication/domain/usecases/register_usecase.dart';
import 'package:book_voices/features/Authentication/presentation/manager/cubit/auth_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../api/firebase/auth_helper_unit_test.dart';
import 'auth_cubit.mocks.dart';

@GenerateNiceMocks([
  MockSpec<LoginUsecase>(),
  MockSpec<RegisterUsecase>(),
  MockSpec<LogoutUsecase>()
])
void main() {
  MockLoginUsecase? mockLoginUsecase;
  MockRegisterUsecase? mockRegisterUsecase;
  MockLogoutUsecase? mockLogoutUsecase;
  MockUser? user;

  AuthCubit? authCubit;

  setUp(() {
    mockLoginUsecase = MockLoginUsecase();
    mockRegisterUsecase = MockRegisterUsecase();
    mockLogoutUsecase = MockLogoutUsecase();
    user = MockUser();

    authCubit = AuthCubit(
        loginUsecase: mockLoginUsecase!,
        registerUsecase: mockRegisterUsecase!,
        logoutUsecase: mockLogoutUsecase!);
  });

  // Dispose Cubit
  tearDown(() {
    authCubit!.close();
  });
  group("Auth cubit Login", () {
    String emailTest = "test@example.com";
    String passwordTest = "password";
    blocTest<AuthCubit, AuthState>(
        "emits [AuthLoadingLogin, AuthSuccessLogin] when login succeeds",
        build: () => authCubit!,
        act: (cubit) {
          when(mockLoginUsecase!.execute(emailTest, passwordTest))
              .thenAnswer((_) async => Right(user!));
          return cubit.makeLogin(emailTest, passwordTest);
        },
        expect: () => [isA<AuthLoadingLogin>(), isA<AuthSuccessLogin>()]);

    blocTest<AuthCubit, AuthState>(
        "emits [AuthLoadingLogin, AuthFailedLogin] when login fails",
        build: () => authCubit!,
        act: (cubit) {
          when(mockLoginUsecase!.execute(emailTest, passwordTest))
              .thenAnswer((_) async => Left(ServerFailure("failed")));
          return cubit.makeLogin(emailTest, passwordTest);
        },
        expect: () => [isA<AuthLoadingLogin>(), isA<AuthFailedLogin>()]);
  });

  group("Auth cubit register", () {
    String emailTest = "test@example.com";
    String passwordTest = "password";
    blocTest<AuthCubit, AuthState>(
        "emits [AuthLoadingRegister, AuthSuccessRegister] when register succeeds",
        build: () => authCubit!,
        act: (cubit) {
          when(mockRegisterUsecase!.execute(emailTest, passwordTest))
              .thenAnswer((_) async => Right(user!));
          return cubit.makeRegister(emailTest, passwordTest);
        },
        expect: () => [isA<AuthLoadingRegister>(), isA<AuthSuccessRegister>()]);

    blocTest<AuthCubit, AuthState>(
        "emits [AuthLoadingRegister, AuthFailedRegister] when register fails",
        build: () => authCubit!,
        act: (cubit) {
          when(mockRegisterUsecase!.execute(emailTest, passwordTest))
              .thenAnswer((_) async => Left(ServerFailure("failed")));
          return cubit.makeRegister(emailTest, passwordTest);
        },
        expect: () => [isA<AuthLoadingRegister>(), isA<AuthFailedRegister>()]);
  });
}
