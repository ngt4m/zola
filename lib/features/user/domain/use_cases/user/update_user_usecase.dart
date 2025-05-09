import 'package:what_chat/features/user/domain/entities/user_entity.dart';
import 'package:what_chat/features/user/domain/repositories/user_responsitory.dart';

class UpdateUserUsecase {
  final UserResponsitory repository;

  UpdateUserUsecase({required this.repository});

  Future<void> call(UserEntity user) async {
    return repository.UpdateUser(user);
  }
}
