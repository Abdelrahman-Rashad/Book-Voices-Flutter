import 'package:book_voices/api/firebase/auth_helper/auth_helper.dart';
import 'package:book_voices/core/error/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_helper_unit_test.mocks.dart';

class MockUser extends Mock implements User {}

class MockServerFailure extends Mock implements ServerFailure {}

@GenerateMocks([FirebaseAuth, UserCredential, User])
void main() {
  MockFirebaseAuth? mockFirebaseAuth;
  MockUserCredential? mockUserCredential;
  MockUser? mockUser;
  AuthHelper? authHelper;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockUserCredential = MockUserCredential();
    mockUser = MockUser();
    authHelper = AuthHelper(mockFirebaseAuth!);
  });

  group("Login", () {
    test("test login using email & password if it success", () async {
      String testEmail = "test@example.com";
      String testPassword = "test@123";

      // Arrange
      when(mockFirebaseAuth!.signInWithEmailAndPassword(
              email: testEmail, password: testPassword))
          .thenAnswer((_) async => mockUserCredential!);

      when(mockUserCredential!.user).thenReturn(mockUser);

      // Act
      final result = await authHelper!
          .signInWithEmailAndPassword(email: testEmail, password: testPassword);

      // Assert
      expect(result, isA<User>());
    });

    test("test login using email & password if it failed", () async {
      String testEmail = "test@example.com";
      String testPassword = "wrongpassword";

      // Arrange
      when(mockFirebaseAuth!.signInWithEmailAndPassword(
        email: testEmail,
        password: testPassword,
      )).thenThrow(FirebaseAuthException(
        code: 'user-not-found',
        message: 'No user found for that email.',
      ));

      // Act & Assert
      expect(
        () => authHelper!.signInWithEmailAndPassword(
            email: testEmail, password: testPassword),
        throwsA(isA<ServerFailure>().having(
          (e) => e.message,
          'message',
          contains('لا يوجد مستخدم مسجل بهذا البريد الإلكتروني.'),
        )),
      );
    });
  });
  group("Register", () {
    test("test register using email & password if it success", () async {
      String testEmail = "test@example.com";
      String testPassword = "pass@123";

      when(mockFirebaseAuth!.createUserWithEmailAndPassword(
              email: testEmail, password: testPassword))
          .thenAnswer((_) async => mockUserCredential!);
      when(mockUserCredential!.user).thenReturn(mockUser);

      final result = await authHelper!.registerWithEmailAndPassword(
          email: testEmail, password: testPassword);

      expect(result, isA<User>());
    });

    test("test register using email & password if it failed", () async {
      String testEmail = "test@example.com";
      String testPassword = "wrongpassword";

      when(mockFirebaseAuth!.createUserWithEmailAndPassword(
              email: testEmail, password: testPassword))
          .thenThrow(FirebaseAuthException(code: "email-already-in-use"));

      try {
        await authHelper!.registerWithEmailAndPassword(
            email: testEmail, password: testPassword);
      } catch (e) {
        expect(
            e,
            isA<ServerFailure>().having(
                (e) => e.message,
                "message",
                contains(
                    "هذا البريد الإلكتروني مسجل بالفعل. يرجى استخدام بريد إلكتروني آخر.")));
      }
    });
  });
}
