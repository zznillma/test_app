import 'package:injectable/injectable.dart';
import 'package:test_app/features/auth/data/models/auth_model.dart';
import 'package:test_app/features/auth/domain/repositories/auth_repository.dart';

@injectable
class AuthUseCase {
  final AuthRepository authRepository;

  AuthUseCase({required this.authRepository});

  Future<AuthModel> getLogin(AuthModel authModel) async =>
      await authRepository.getLogin(authModel);
}
