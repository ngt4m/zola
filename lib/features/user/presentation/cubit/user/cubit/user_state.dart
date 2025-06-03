part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

class UserLoading extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoaded extends UserState {
  final List<UserEntity> users;

  const UserLoaded({required this.users});
  @override
  List<Object> get props => [users];
}

class UserFailure extends UserState {
  @override
  List<Object> get props => [];
}