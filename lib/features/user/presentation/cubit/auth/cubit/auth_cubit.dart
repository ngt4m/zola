import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:what_chat/features/user/domain/use_cases/credential/get_current_uid_usecase.dart';
import 'package:what_chat/features/user/domain/use_cases/credential/is_sign_in_usecase.dart';
import 'package:what_chat/features/user/domain/use_cases/credential/sign_out_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final GetCurrentUidUsecase getCurrentUidUseCase;
  final IsSignInUsecase isSignInUseCase;
  final SignOutUsecase signOutUseCase;
  AuthCubit(
    {
    required  this.getCurrentUidUseCase,required this.isSignInUseCase,required this.signOutUseCase})
      : super(AuthInitial());

  Future<void> AppStarted() async {
    try {
      bool isSignIn = await isSignInUseCase.call();
      if (isSignIn) {
        final uid = await getCurrentUidUseCase.call();
        emit(Authenticated(uid: uid));
      } else {
        emit(UnAuthenticated());
      }
    } catch (_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> LoggedIn() async {
    try {
      final uid = await getCurrentUidUseCase.call();
      emit(Authenticated(uid: uid));
    } catch (_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> LoggedOut() async {
    try {
      await signOutUseCase.call();
      emit(UnAuthenticated());
    } catch (_) {
      emit(UnAuthenticated());
    }
  }
}
