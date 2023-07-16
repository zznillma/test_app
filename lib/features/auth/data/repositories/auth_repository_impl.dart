import 'package:injectable/injectable.dart';
import 'package:test_app/features/auth/data/models/auth_model.dart';
import 'package:test_app/features/auth/domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  late String email;
  late String password;

  @override
  Future<AuthModel> getLogin(AuthModel authModel) async {
    AuthModel user = AuthModel(
      email: 'name',
      password: 'password',
    );
    try {
      if (authModel.email == user.email &&
          authModel.password == user.password) {
        return user;
      }

      throw user;
    } catch (e) {
      throw e.toString();
    }
  }
}
