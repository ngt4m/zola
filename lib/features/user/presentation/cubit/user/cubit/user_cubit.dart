import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:what_chat/features/user/domain/entities/user_entity.dart';
import 'package:what_chat/features/user/domain/use_cases/user/get_all_user_usecase.dart';
import 'package:what_chat/features/user/domain/use_cases/user/update_user_usecase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UpdateUserUsecase updateUserUseCase;
  final GetAllUserUsecase getAllUsersUseCase;
  UserCubit({required this.updateUserUseCase, required this.getAllUsersUseCase})
      : super(UserInitial());
  Future<void> GetAllUsers() async {
    emit(UserLoading());
    final streamResponse = getAllUsersUseCase.call();
    streamResponse.listen((users) {
      emit(UserLoaded(users: users));
    });
  }

  Future<void> UpdateUser({required UserEntity user}) async {
    try {
      await updateUserUseCase.call(user);
    } catch (e) {
      emit(UserFailure());
    }
  }
}
