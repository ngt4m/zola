import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:what_chat/features/user/domain/entities/contact_entity.dart';
import 'package:what_chat/features/user/domain/use_cases/user/get_device_number_usercase.dart';

part 'get_device_number_state.dart';

class GetDeviceNumberCubit extends Cubit<GetDeviceNumberState> {
  GetDeviceNumberUsercase getDeviceNumberUseCase;
  GetDeviceNumberCubit({required this.getDeviceNumberUseCase})
      : super(GetDeviceNumberInitial());
  Future<void> GetDeviceNumber() async {
    try {
      final contactNumbers = await getDeviceNumberUseCase.call();
      emit(GetDeviceNumberLoaded(contacts: contactNumbers));
    } catch (_) {
      emit(GetDeviceNumberFailure());
    }
  }
}
