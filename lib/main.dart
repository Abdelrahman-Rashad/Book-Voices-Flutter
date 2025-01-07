import 'package:book_voices/core/service_locator/service_locator.dart';
import 'package:book_voices/features/Authentication/presentation/manager/cubit/auth_cubit.dart';
import 'package:book_voices/features/Authentication/presentation/pages/login.dart';
import 'package:book_voices/features/Authentication/presentation/pages/resgister_page.dart';
import 'package:book_voices/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => sl<AuthCubit>())],
      child: MaterialApp(
        home: Login(),
      ),
    );
  }
}
