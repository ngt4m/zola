
import 'package:what_chat/features/user/domain/repositories/user_responsitory.dart';

class GetCurrentUidUsecase {
  final UserResponsitory responsitory;
  GetCurrentUidUsecase ({required this.responsitory});
  Future<String> call() async{
    return responsitory.GetCurrentUID();
  }
}