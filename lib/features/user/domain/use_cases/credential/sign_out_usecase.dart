import 'package:what_chat/features/user/domain/repositories/user_responsitory.dart';

class SignOutUsecase {
  final UserResponsitory responsitory;
  SignOutUsecase({required this.responsitory});
  Future<void> call() async {
    return responsitory.SignOut();
  }
}
