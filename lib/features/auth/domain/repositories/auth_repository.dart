import 'package:test_app/features/auth/data/models/auth_model.dart';

abstract class AuthRepository {

  Future<AuthModel> getLogin(AuthModel authModel);
}
