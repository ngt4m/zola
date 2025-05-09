import 'package:what_chat/features/user/domain/repositories/user_responsitory.dart';

class IsSignInUsecase {
  final UserResponsitory responsitory;
  IsSignInUsecase ({required this.responsitory});
  Future<bool> call() async{
    return responsitory.IsSignIn();
  }
}