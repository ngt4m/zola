
import 'package:what_chat/features/user/domain/repositories/user_responsitory.dart';

class VerifyPhoneNumberUsecase {
  final UserResponsitory responsitory;
  VerifyPhoneNumberUsecase ({required this.responsitory});
  Future<void> call(String phoneNumber) async{
    return responsitory.VerifyPhoneNumber(phoneNumber);
  }
}