import 'package:what_chat/features/user/domain/entities/user_entity.dart';
import 'package:what_chat/features/user/domain/repositories/user_responsitory.dart';

class GetSingleUserUsecase{
    final UserResponsitory repository;

  GetSingleUserUsecase({required this.repository});

  Stream<List<UserEntity>> call(String uid)  {
    return repository.GetSingleUser(uid);
  }

}