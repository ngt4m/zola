import 'package:what_chat/features/user/domain/entities/user_entity.dart';
import 'package:what_chat/features/user/domain/repositories/user_responsitory.dart';

class CreateUserUsecase {
  final UserResponsitory repository;

  CreateUserUsecase({required this.repository});

  Future<void> call(UserEntity user) async {
    return repository.CreateUser(user);
  }
}
