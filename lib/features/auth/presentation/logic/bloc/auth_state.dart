part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginFetched extends AuthState {}

class AuthErrorState extends AuthState {
  final String error;

  AuthErrorState({required this.error});
}

class AuthLoadingState extends AuthState {}
