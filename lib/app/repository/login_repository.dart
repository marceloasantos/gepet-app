import 'base_repository.dart';

class LoginRepository {
  final BaseRepository _baseRepository;

  LoginRepository(this._baseRepository);

  login(String email, String password) async {
    return _baseRepository.post(
      endpoint: "/login",
      body: {
        "email": email,
        "senha": password,
      },
      requiresToken: false,
    );
  }
}
