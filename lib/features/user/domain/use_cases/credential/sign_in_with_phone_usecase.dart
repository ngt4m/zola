import 'package:what_chat/features/user/domain/repositories/user_responsitory.dart';

class SignInWithPhoneUsecase {
  final UserResponsitory responsitory;
  SignInWithPhoneUsecase({required this.responsitory});
  Future<void> call(String smsPinCode) async {
    return responsitory.SignInWithPhoneNumber(smsPinCode);
  }
}
