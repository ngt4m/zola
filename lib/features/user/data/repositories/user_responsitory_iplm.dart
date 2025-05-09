import 'package:what_chat/features/user/data/data_sources/user_remote_data_source.dart';
import 'package:what_chat/features/user/domain/entities/contact_entity.dart';
import 'package:what_chat/features/user/domain/entities/user_entity.dart';
import 'package:what_chat/features/user/domain/repositories/user_responsitory.dart';

class UserRepositoryImpl implements UserResponsitory {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> CreateUser(UserEntity user) async =>
      remoteDataSource.CreateUser(user);

  @override
  Stream<List<UserEntity>> GetAllUsers() => remoteDataSource.GetAllUsers();

  @override
  Future<String> GetCurrentUID() async => remoteDataSource.GetCurrentUID();

  @override
  Future<List<ContactEntity>> GetDeviceNumber() async =>
      remoteDataSource.GetDeviceNumber();

  @override
  Stream<List<UserEntity>> GetSingleUser(String uid) =>
      remoteDataSource.GetSingleUser(uid);
  @override
  Future<bool> IsSignIn() async => remoteDataSource.IsSignIn();

  @override
  Future<void> SignInWithPhoneNumber(String smsPinCode) async =>
      remoteDataSource.SignInWithPhoneNumber(smsPinCode);

  @override
  Future<void> SignOut() async => remoteDataSource.SignOut();

  @override
  Future<void> UpdateUser(UserEntity user) async =>
      remoteDataSource.UpdateUser(user);

  @override
  Future<void> VerifyPhoneNumber(String phoneNumber) async =>
      remoteDataSource.VerifyPhoneNumber(phoneNumber);
}
