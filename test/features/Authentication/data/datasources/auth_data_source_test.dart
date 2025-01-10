import 'package:book_voices/api/firebase/auth_helper/auth_helper.dart';
import 'package:book_voices/core/error/failure.dart';
import 'package:book_voices/features/Authentication/data/datasources/auth_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../api/firebase/auth_helper_unit_test.dart';
import 'auth_data_source_test.mocks.dart';

@GenerateMocks([AuthHelper])
void main() {
  MockUser user = MockUser();
  MockAuthHelper mockAuthHelper = MockAuthHelper();
  AuthDataSourceImpl authDataSourceImpl =
      AuthDataSourceImpl(authHelper: mockAuthHelper);

  group("login for data source", () {
    test("login success", () async {
      String emailTest = "test@example.com";
      String passwordTest = "password";

      // arrange
      when(mockAuthHelper.signInWithEmailAndPassword(
              email: emailTest, password: passwordTest))
          .thenAnswer((_) async {
        return user;
      });

      // act
      final result = await authDataSourceImpl.login(emailTest, passwordTest);

      // assert
      expect(result, isA<User>());
    });

    test("login failed", () async {
      String emailTest = "test@example.com";
      String passwordTest = "password";

      // arrange
      when(mockAuthHelper.signInWithEmailAndPassword(
              email: emailTest, password: passwordTest))
          .thenThrow(ServerFailure('No user found for that email.'));

      try {
        // act
        await authDataSourceImpl.login(emailTest, passwordTest);
      } catch (e) {
        // assert
        expect(
            e,
            isA<ServerFailure>().having(
                (e) => e.message, "massage", "No user found for that email."));
      }
    });
  });

  group("register for data source", () {
    test("register success", () async {
      String emailTest = "test@example.com";
      String passwordTest = "password";

      // arrange
      when(mockAuthHelper.registerWithEmailAndPassword(
              email: emailTest, password: passwordTest))
          .thenAnswer((_) async {
        return user;
      });

      // act
      final result = await authDataSourceImpl.register(emailTest, passwordTest);

      // assert
      expect(result, isA<User>());
    });

    test("register failed", () async {
      String emailTest = "test@example.com";
      String passwordTest = "password";

      // arrange
      when(mockAuthHelper.registerWithEmailAndPassword(
              email: emailTest, password: passwordTest))
          .thenThrow(ServerFailure('No user found for that email.'));

      try {
        // act
        await authDataSourceImpl.register(emailTest, passwordTest);
      } catch (e) {
        // assert
        expect(
            e,
            isA<ServerFailure>().having(
                (e) => e.message, "massage", "No user found for that email."));
      }
    });
  });
}
