part of 'auth_bloc.dart';

abstract class AuthEvent {}

class GetLoginEvent extends AuthEvent {
  final AuthModel authModel;

  GetLoginEvent({required this.authModel});
}
