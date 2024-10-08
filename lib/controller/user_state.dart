 
class UserState {}

final class UserInitial extends UserState {}

final class SignInSuccess extends UserState {}

final class SignInLoading extends UserState {}

final class SignInFailure extends UserState {
  final String errMessage;

  SignInFailure({required this.errMessage});
}

final class SignUpSuccess extends UserState {}

final class SignUpLoading extends UserState {}

final class SignUpFailure extends UserState {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}
final class AccountSuccess extends UserState {}

final class AccountLoading extends UserState {}
final class AccountFail extends UserState {}




final class GetUserSuccess extends UserState {
  
}
final class GetUserLoading extends UserState {}

final class GetUserFailure extends UserState {
  final String errMessage;

  GetUserFailure({required this.errMessage});

}
final class SuccessCreated extends UserState{}
