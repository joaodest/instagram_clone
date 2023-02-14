import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:instagram_clone/features/data/data_sources/remote_data_source/remote_data_source.dart';
import 'package:instagram_clone/features/data/data_sources/remote_data_source/remote_data_source_impl.dart';
import 'package:instagram_clone/features/data/repository/firebase_repository_impl.dart';
import 'package:instagram_clone/features/domain/repository/firebase_repository.dart';
import 'package:instagram_clone/features/domain/usecases/firebase_usecases/user/create_user_usecase.dart';
import 'package:instagram_clone/features/domain/usecases/firebase_usecases/user/get_current_uid_usecase.dart';
import 'package:instagram_clone/features/domain/usecases/firebase_usecases/user/get_single_user_usecase.dart';
import 'package:instagram_clone/features/domain/usecases/firebase_usecases/user/get_users_usecase.dart';
import 'package:instagram_clone/features/domain/usecases/firebase_usecases/user/is_sign_in_usecase.dart';
import 'package:instagram_clone/features/domain/usecases/firebase_usecases/user/sign_in_user_usecase.dart';
import 'package:instagram_clone/features/domain/usecases/firebase_usecases/user/sign_out_usecase.dart';
import 'package:instagram_clone/features/domain/usecases/firebase_usecases/user/sign_up_user_usecase.dart';
import 'package:instagram_clone/features/domain/usecases/firebase_usecases/user/update_user_usecase.dart';
import 'package:instagram_clone/features/presentation/cubit/auth/auth_cubit.dart';
import 'package:instagram_clone/features/presentation/cubit/credential/credential_cubit.dart';
import 'package:instagram_clone/features/presentation/cubit/user/get_single_user/get_single_user_cubit.dart';
import 'package:instagram_clone/features/presentation/cubit/user/user_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Cubits
  sl.registerFactory(
    () => AuthCubit(
      signOutUserUsecase: sl.call(),
      isSignInUsecase: sl.call(),
      getCurrentUidUsecase: sl.call(),
    ),
  );

  sl.registerFactory(
    () => CredentialCubit(
      signUpUserUsecase: sl.call(),
      signInUserUsecase: sl.call(),
    ),
  );

  sl.registerFactory(
    () => UserCubit(
      updateUserUsecase: sl.call(),
      getUsersUsecase: sl.call(),
    ),
  );

  sl.registerFactory(
    () => GetSingleUserCubit(
      getSingleUserUsecase: sl.call(),
    ),
  );

  // Use Cases
  sl.registerLazySingleton(() => SignOutUserUsecase(repository: sl.call()));
  sl.registerLazySingleton(() => IsSignInUsecase(repository: sl.call()));
  sl.registerLazySingleton(() => GetCurrentUidUsecase(repository: sl.call()));
  sl.registerLazySingleton(() => SignUpUserUsecase(repository: sl.call()));
  sl.registerLazySingleton(() => SignInUserUsecase(repository: sl.call()));
  sl.registerLazySingleton(() => UpdateUserUsecase(repository: sl.call()));
  sl.registerLazySingleton(() => GetUsersUsecase(repository: sl.call()));
  sl.registerLazySingleton(() => CreateUserUsecase(repository: sl.call()));
  sl.registerLazySingleton(() => GetSingleUserUsecase(repository: sl.call()));

  // Repository

  sl.registerLazySingleton<FirebaseRepository>(
    () => FirebaseRepositoryImpl(remoteDataSource: sl.call()),
  );

  // Remote Data Sources

  sl.registerLazySingleton<FirebaseRemoteDataSource>(
    () => FirebaseRemoteDataSourceImpl(
      firebaseFirestore: sl.call(),
      firebaseAuth: sl.call(),
    ),
  );

  // Externals

  final firebaseFirestore = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;

  sl.registerLazySingleton(() => firebaseFirestore);
  sl.registerLazySingleton(() => firebaseAuth);
}
