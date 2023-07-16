import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/features/auth/data/models/auth_model.dart';
import 'package:test_app/features/auth/domain/use_case/auth_use_case.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_app/features/auth/presentation/logic/bloc/auth_bloc.dart';

class MockAuthUseCase extends Mock implements AuthUseCase {}

void main() {
  AuthUseCase useCase = MockAuthUseCase();

  AuthModel user = AuthModel(email: 'test@example.ru', password: 'password');

  blocTest(
    'Auth',
    build: () => AuthBloc(useCase),
    act: (bloc) {
      when(
        () => useCase.getLogin(user),
      ).thenAnswer(
        (_) => Future.value(user),
      );
      bloc.add(
        GetLoginEvent(authModel: user),
      );
    },
    expect: () => [
      isA<AuthLoadingState>(),
      isA<LoginFetched>(),
    ],
  );
}
