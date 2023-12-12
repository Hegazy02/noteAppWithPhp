class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthFailure extends AuthState {
  final String errMessage;
  AuthFailure({required this.errMessage});
}

final class AuthSuccess extends AuthState {
  final Map<String, dynamic> userData;
  AuthSuccess({required this.userData});
}
