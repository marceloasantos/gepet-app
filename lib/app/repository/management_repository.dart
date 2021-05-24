import 'package:gepet_app/app/repository/base_repository.dart';

class ManagementRepository {
  final BaseRepository _baseRepository;

  ManagementRepository(this._baseRepository);

  listUsers() {
    return _baseRepository.get(endpoint: "/usuario/todos");
  }
}
