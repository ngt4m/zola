import 'package:what_chat/features/user/domain/entities/contact_entity.dart';
import 'package:what_chat/features/user/domain/repositories/user_responsitory.dart';

class GetDeviceNumberUsercase {
    final UserResponsitory repository;

  GetDeviceNumberUsercase({required this.repository});

  Future<List<ContactEntity>> call() async {
    return repository.GetDeviceNumber();
  }

}