import 'package:book_voices/features/Authentication/data/datasources/auth_data_source.dart';
import 'package:book_voices/features/Authentication/data/repositories/auth_repo_impl.dart';
import 'package:book_voices/features/Authentication/domain/repositories/auth_repo.dart';
import 'package:book_voices/features/Authentication/domain/usecases/login_usecase.dart';
import 'package:book_voices/features/Authentication/domain/usecases/register_usecase.dart';
import 'package:book_voices/features/Authentication/presentation/manager/cubit/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../api/firebase/auth_helper/auth_helper.dart';
import '../../features/Authentication/domain/usecases/logout_usecase.dart';

final sl = GetIt.instance;
void setUp() {
  // initalize DataSource
  sl.registerLazySingleton<AuthDataSource>(
      () => AuthDataSourceImpl(authHelper: AuthHelper(FirebaseAuth.instance)));

  // initalize Repository
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl()));

  // initalize Usecases
  sl.registerLazySingleton(() => LoginUsecase(sl()));
  sl.registerLazySingleton(() => LogoutUsecase(sl()));
  sl.registerLazySingleton(() => RegisterUsecase(sl()));

  // initalize Cubit
  sl.registerLazySingleton(() => AuthCubit(
      loginUsecase: sl(), logoutUsecase: sl(), registerUsecase: sl()));
}
