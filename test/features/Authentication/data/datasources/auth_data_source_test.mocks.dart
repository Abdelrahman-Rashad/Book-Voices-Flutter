// Mocks generated by Mockito 5.4.5 from annotations
// in book_voices/test/features/Authentication/data/datasources/auth_data_source_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:book_voices/api/firebase/auth_helper/auth_helper.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i2;
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

class _FakeFirebaseAuth_0 extends _i1.SmartFake implements _i2.FirebaseAuth {
  _FakeFirebaseAuth_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeUser_1 extends _i1.SmartFake implements _i2.User {
  _FakeUser_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [AuthHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthHelper extends _i1.Mock implements _i3.AuthHelper {
  MockAuthHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.FirebaseAuth get firebaseAuth =>
      (super.noSuchMethod(
            Invocation.getter(#firebaseAuth),
            returnValue: _FakeFirebaseAuth_0(
              this,
              Invocation.getter(#firebaseAuth),
            ),
          )
          as _i2.FirebaseAuth);

  @override
  _i4.Future<_i2.User> signInWithEmailAndPassword({
    required String? email,
    required String? password,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#signInWithEmailAndPassword, [], {
              #email: email,
              #password: password,
            }),
            returnValue: _i4.Future<_i2.User>.value(
              _FakeUser_1(
                this,
                Invocation.method(#signInWithEmailAndPassword, [], {
                  #email: email,
                  #password: password,
                }),
              ),
            ),
          )
          as _i4.Future<_i2.User>);

  @override
  _i4.Future<_i2.User> registerWithEmailAndPassword({
    required String? email,
    required String? password,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#registerWithEmailAndPassword, [], {
              #email: email,
              #password: password,
            }),
            returnValue: _i4.Future<_i2.User>.value(
              _FakeUser_1(
                this,
                Invocation.method(#registerWithEmailAndPassword, [], {
                  #email: email,
                  #password: password,
                }),
              ),
            ),
          )
          as _i4.Future<_i2.User>);

  @override
  _i4.Future<void> signOut() =>
      (super.noSuchMethod(
            Invocation.method(#signOut, []),
            returnValue: _i4.Future<void>.value(),
            returnValueForMissingStub: _i4.Future<void>.value(),
          )
          as _i4.Future<void>);
}
