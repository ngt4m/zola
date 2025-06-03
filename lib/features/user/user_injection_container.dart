import 'package:what_chat/features/user/data/data_sources/user_remote_data_source.dart';
import 'package:what_chat/features/user/data/data_sources/user_remote_data_source_iplm.dart';
import 'package:what_chat/features/user/data/repositories/user_responsitory_iplm.dart';
import 'package:what_chat/features/user/domain/repositories/user_responsitory.dart';
import 'package:what_chat/features/user/domain/use_cases/credential/get_current_uid_usecase.dart';
import 'package:what_chat/features/user/domain/use_cases/credential/is_sign_in_usecase.dart';
import 'package:what_chat/features/user/domain/use_cases/credential/sign_in_with_phone_usecase.dart';
import 'package:what_chat/features/user/domain/use_cases/credential/sign_out_usecase.dart';
import 'package:what_chat/features/user/domain/use_cases/credential/verify_phone_number_usecase.dart';
import 'package:what_chat/features/user/domain/use_cases/user/create_user_usecase.dart';
import 'package:what_chat/features/user/domain/use_cases/user/get_all_user_usecase.dart';
import 'package:what_chat/features/user/domain/use_cases/user/get_device_number_usercase.dart';
import 'package:what_chat/features/user/domain/use_cases/user/get_single_user_usecase.dart';
import 'package:what_chat/features/user/domain/use_cases/user/update_user_usecase.dart';
import 'package:what_chat/features/user/presentation/cubit/auth/cubit/auth_cubit.dart';
import 'package:what_chat/features/user/presentation/cubit/credential/cubit/credential_cubit.dart';
import 'package:what_chat/features/user/presentation/cubit/get_device_number/cubit/get_device_number_cubit.dart';
import 'package:what_chat/features/user/presentation/cubit/get_single_user/cubit/get_single_user_cubit.dart';
import 'package:what_chat/features/user/presentation/cubit/user/cubit/user_cubit.dart';
import 'package:what_chat/main_injection_container.dart';

Future<void> UserInjectionContainer() async {
  sl.registerFactory<AuthCubit>(() => AuthCubit(
        getCurrentUidUseCase: sl.call(),
        isSignInUseCase: sl.call(),
        signOutUseCase: sl.call(),
      ));
  sl.registerFactory<UserCubit>(() => UserCubit(
        updateUserUseCase: sl.call(),
        getAllUsersUseCase: sl.call(),
      ));
  sl.registerFactory<GetSingleUserCubit>(() => GetSingleUserCubit(
        getSingleUserUseCase: sl.call(),
      ));
  sl.registerFactory<GetDeviceNumberCubit>(() => GetDeviceNumberCubit(
        getDeviceNumberUseCase: sl.call(),
      ));
  sl.registerFactory(() => CredentialCubit(
        signInWithPhoneNumberUseCase: sl.call(),
        verifyPhoneNumberUseCase: sl.call(),
        createUserUseCase: sl.call(),
      ));

//
  sl.registerFactory<GetCurrentUidUsecase>(() => GetCurrentUidUsecase(
        responsitory: sl.call(),
      ));

  sl.registerLazySingleton<IsSignInUsecase>(
      () => IsSignInUsecase(responsitory: sl.call()));

  sl.registerLazySingleton<SignOutUsecase>(
      () => SignOutUsecase(responsitory: sl.call()));

  sl.registerLazySingleton<CreateUserUsecase>(
      () => CreateUserUsecase(repository: sl.call()));

  sl.registerLazySingleton<GetAllUserUsecase>(
      () => GetAllUserUsecase(repository: sl.call()));

  sl.registerLazySingleton<UpdateUserUsecase>(
      () => UpdateUserUsecase(repository: sl.call()));

  sl.registerLazySingleton<GetSingleUserUsecase>(
      () => GetSingleUserUsecase(repository: sl.call()));

  sl.registerLazySingleton<SignInWithPhoneUsecase>(
      () => SignInWithPhoneUsecase(responsitory: sl.call()));

  sl.registerLazySingleton<VerifyPhoneNumberUsecase>(
      () => VerifyPhoneNumberUsecase(responsitory: sl.call()));

  sl.registerLazySingleton<GetDeviceNumberUsercase>(
      () => GetDeviceNumberUsercase(repository: sl.call()));

  //
  sl.registerLazySingleton<UserResponsitory>(
      () => UserRepositoryImpl(remoteDataSource: sl.call()));

  sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceIplm(
        auth: sl.call(),
        fireStore: sl.call(),
      ));
}
