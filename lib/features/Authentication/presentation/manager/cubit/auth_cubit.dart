// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import 'package:book_voices/features/Authentication/domain/usecases/login_usecase.dart';
import 'package:book_voices/features/Authentication/domain/usecases/logout_usecase.dart';
import 'package:book_voices/features/Authentication/domain/usecases/register_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.loginUsecase,
    required this.registerUsecase,
    required this.logoutUsecase,
  }) : super(AuthInitial());

  final LoginUsecase loginUsecase;
  final RegisterUsecase registerUsecase;
  final LogoutUsecase logoutUsecase;

  Future<void> makeLogin(String email, String password) async {
    emit(AuthLoadingLogin());

    final user = await loginUsecase.execute(email, password);
    user.fold((l) => emit(AuthFailedLogin(l.message)),
        (r) => emit(AuthSuccessLogin(r)));
  }

  Future<void> makeRegister(String email, String password) async {
    emit(AuthLoadingRegister());

    final user = await registerUsecase.execute(email, password);
    user.fold((l) => emit(AuthFailedRegister(l.message)),
        (r) => emit(AuthSuccessRegister(r)));
  }

  Future<void> makeLogout() async {
    emit(AuthLoadingLogout());

    final user = await logoutUsecase.execute();
    user.fold((l) => emit(AuthFailedLogout(l.message)),
        (r) => emit(AuthSuccessLogout()));
  }

  @override
  void onChange(Change<AuthState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
