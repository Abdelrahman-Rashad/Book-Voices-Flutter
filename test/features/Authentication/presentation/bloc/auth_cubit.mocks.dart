// Mocks generated by Mockito 5.4.5 from annotations
// in book_voices/test/features/Authentication/presentation/bloc/auth_cubit.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:book_voices/core/error/failure.dart' as _i6;
import 'package:book_voices/features/Authentication/domain/repositories/auth_repo.dart'
    as _i2;
import 'package:book_voices/features/Authentication/domain/usecases/login_usecase.dart'
    as _i4;
import 'package:book_voices/features/Authentication/domain/usecases/logout_usecase.dart'
    as _i9;
import 'package:book_voices/features/Authentication/domain/usecases/register_usecase.dart'
    as _i8;
import 'package:dartz/dartz.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeAuthRepo_0 extends _i1.SmartFake implements _i2.AuthRepo {
  _FakeAuthRepo_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [LoginUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginUsecase extends _i1.Mock implements _i4.LoginUsecase {
  @override
  _i2.AuthRepo get authRepo =>
      (super.noSuchMethod(
            Invocation.getter(#authRepo),
            returnValue: _FakeAuthRepo_0(this, Invocation.getter(#authRepo)),
            returnValueForMissingStub: _FakeAuthRepo_0(
              this,
              Invocation.getter(#authRepo),
            ),
          )
          as _i2.AuthRepo);

  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.User>> execute(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#execute, [email, password]),
            returnValue: _i5.Future<_i3.Either<_i6.Failure, _i7.User>>.value(
              _FakeEither_1<_i6.Failure, _i7.User>(
                this,
                Invocation.method(#execute, [email, password]),
              ),
            ),
            returnValueForMissingStub:
                _i5.Future<_i3.Either<_i6.Failure, _i7.User>>.value(
                  _FakeEither_1<_i6.Failure, _i7.User>(
                    this,
                    Invocation.method(#execute, [email, password]),
                  ),
                ),
          )
          as _i5.Future<_i3.Either<_i6.Failure, _i7.User>>);
}

/// A class which mocks [RegisterUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockRegisterUsecase extends _i1.Mock implements _i8.RegisterUsecase {
  @override
  _i2.AuthRepo get authRepo =>
      (super.noSuchMethod(
            Invocation.getter(#authRepo),
            returnValue: _FakeAuthRepo_0(this, Invocation.getter(#authRepo)),
            returnValueForMissingStub: _FakeAuthRepo_0(
              this,
              Invocation.getter(#authRepo),
            ),
          )
          as _i2.AuthRepo);

  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.User>> execute(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#execute, [email, password]),
            returnValue: _i5.Future<_i3.Either<_i6.Failure, _i7.User>>.value(
              _FakeEither_1<_i6.Failure, _i7.User>(
                this,
                Invocation.method(#execute, [email, password]),
              ),
            ),
            returnValueForMissingStub:
                _i5.Future<_i3.Either<_i6.Failure, _i7.User>>.value(
                  _FakeEither_1<_i6.Failure, _i7.User>(
                    this,
                    Invocation.method(#execute, [email, password]),
                  ),
                ),
          )
          as _i5.Future<_i3.Either<_i6.Failure, _i7.User>>);
}

/// A class which mocks [LogoutUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockLogoutUsecase extends _i1.Mock implements _i9.LogoutUsecase {
  @override
  _i2.AuthRepo get authRepo =>
      (super.noSuchMethod(
            Invocation.getter(#authRepo),
            returnValue: _FakeAuthRepo_0(this, Invocation.getter(#authRepo)),
            returnValueForMissingStub: _FakeAuthRepo_0(
              this,
              Invocation.getter(#authRepo),
            ),
          )
          as _i2.AuthRepo);

  @override
  _i5.Future<_i3.Either<_i6.Failure, void>> execute() =>
      (super.noSuchMethod(
            Invocation.method(#execute, []),
            returnValue: _i5.Future<_i3.Either<_i6.Failure, void>>.value(
              _FakeEither_1<_i6.Failure, void>(
                this,
                Invocation.method(#execute, []),
              ),
            ),
            returnValueForMissingStub:
                _i5.Future<_i3.Either<_i6.Failure, void>>.value(
                  _FakeEither_1<_i6.Failure, void>(
                    this,
                    Invocation.method(#execute, []),
                  ),
                ),
          )
          as _i5.Future<_i3.Either<_i6.Failure, void>>);
}