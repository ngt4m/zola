import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:what_chat/features/user/domain/entities/user_entity.dart';
import 'package:what_chat/features/user/domain/use_cases/user/get_single_user_usecase.dart';

part 'get_single_user_state.dart';

class GetSingleUserCubit extends Cubit<GetSingleUserState> {
  final GetSingleUserUsecase getSingleUserUseCase;
  GetSingleUserCubit({required this.getSingleUserUseCase})
      : super(GetSingleUserInitial());
  Future<void> GetSingleUser({required String uid}) async {
    emit(GetSingleUserLoading());
    final streamResponse = getSingleUserUseCase.call(uid);
    streamResponse.listen((users) {
      emit(GetSingleUserLoaded(singleUser: users.first));
    });
  }
}
