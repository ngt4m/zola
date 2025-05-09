import 'package:what_chat/features/user/domain/entities/user_entity.dart';
import 'package:what_chat/features/user/domain/repositories/user_responsitory.dart';

class GetAllUserUsecase {
  final UserResponsitory repository;

  GetAllUserUsecase({required this.repository});

  Stream<List<UserEntity>> call() {
    return repository.GetAllUsers();
  }
}
