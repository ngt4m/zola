import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:what_chat/features/user/domain/entities/user_entity.dart';
import 'package:what_chat/features/user/domain/use_cases/credential/sign_in_with_phone_usecase.dart';
import 'package:what_chat/features/user/domain/use_cases/credential/verify_phone_number_usecase.dart';
import 'package:what_chat/features/user/domain/use_cases/user/create_user_usecase.dart';

part 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  final SignInWithPhoneUsecase signInWithPhoneNumberUseCase;
  final VerifyPhoneNumberUsecase verifyPhoneNumberUseCase;
  final CreateUserUsecase createUserUseCase;
  CredentialCubit(
      {required this.signInWithPhoneNumberUseCase,
      required this.verifyPhoneNumberUseCase,
      required this.createUserUseCase})
      : super(CredentialInitial());

  Future<void> SubmitVerifyPhoneNumber({required String phoneNumber}) async {
    try {
      await verifyPhoneNumberUseCase.call(phoneNumber);
      emit(CredentialPhoneAuthSmsCodeReceived());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  Future<void> SubmitSmsCode({required String smsCode}) async {
    try {
      await signInWithPhoneNumberUseCase.call(smsCode);
      emit(CredentialPhoneAuthProfileInfo());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  Future<void> SubmitProfileInfo({required UserEntity user}) async {
    try {
      await createUserUseCase.call(user);
      emit(CredentialSuccess());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }
}
