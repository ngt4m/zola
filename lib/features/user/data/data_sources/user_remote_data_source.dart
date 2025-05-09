import 'package:what_chat/features/user/domain/entities/contact_entity.dart';
import 'package:what_chat/features/user/domain/entities/user_entity.dart';

abstract class UserRemoteDataSource {
  Future<void> VerifyPhoneNumber(String phoneNumber);
  Future<void> SignInWithPhoneNumber(String smsPinCode);

  Future<bool> IsSignIn();
  Future<void> SignOut();
  Future<String> GetCurrentUID();
  Future<void> CreateUser(UserEntity user);
  Future<void> UpdateUser(UserEntity user);
  Stream<List<UserEntity>> GetAllUsers();
  Stream<List<UserEntity>> GetSingleUser(String uid);

  Future<List<ContactEntity>> GetDeviceNumber();
}
