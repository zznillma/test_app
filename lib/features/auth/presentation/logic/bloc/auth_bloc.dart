import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/features/auth/domain/use_case/auth_use_case.dart';

import '../../../data/models/auth_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase useCase;

  AuthBloc(this.useCase) : super(AuthInitial()) {
    on<GetLoginEvent>((event, emit) async {
      emit(AuthLoadingState());

      await useCase
          .getLogin(event.authModel)
          .then(
            (value) => emit(
              LoginFetched(),
            ),
          )
          .onError(
            (error, stackTrace) => emit(
              AuthErrorState(error: error.toString()),
            ),
          );
    });
  }
}
