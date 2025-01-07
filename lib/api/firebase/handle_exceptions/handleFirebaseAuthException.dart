import 'package:firebase_auth/firebase_auth.dart';

class handleFirebaseAuthException {
  static String signInHandleFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'البريد الإلكتروني المدخل غير صالح. يرجى التحقق من التنسيق.';

      case 'user-disabled':
        return 'تم تعطيل حساب المستخدم. يرجى التواصل مع الدعم الفني.';

      case 'user-not-found':
        return 'لا يوجد مستخدم مسجل بهذا البريد الإلكتروني.';

      case 'wrong-password':
        return 'كلمة المرور غير صحيحة. يرجى المحاولة مرة أخرى.';

      case 'INVALID_LOGIN_CREDENTIALS':
      case 'invalid-credential':
        return 'البريد الإلكتروني المدخل غير مسجل. يرجى التحقق من البريد الإلكتروني أو إنشاء حساب جديد.';

      case 'too-many-requests':
        return 'عدد كبير جدًا من المحاولات. يرجى الانتظار قبل المحاولة مجددًا.';

      case 'network-request-failed':
        return 'خطأ في الاتصال بالشبكة. تأكد من اتصالك بالإنترنت.';

      default:
        return 'حدث خطأ غير متوقع: ${e.message}';
    }
  }

  static String registerhandleFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return 'هذا البريد الإلكتروني مسجل بالفعل. يرجى استخدام بريد إلكتروني آخر.';

      case 'invalid-email':
        return 'البريد الإلكتروني المدخل غير صالح. يرجى التحقق من التنسيق.';

      case 'weak-password':
        return 'كلمة المرور ضعيفة جدًا. يرجى اختيار كلمة مرور أقوى.';

      case 'too-many-requests':
        return 'عدد كبير جدًا من المحاولات. يرجى الانتظار قبل المحاولة مجددًا.';

      case 'network-request-failed':
        return 'خطأ في الاتصال بالشبكة. تأكد من اتصالك بالإنترنت.';

      default:
        return 'حدث خطأ غير متوقع: ${e.message}';
    }
  }
}
