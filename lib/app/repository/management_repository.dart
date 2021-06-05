import 'package:gepet_app/app/model/animal_model.dart';
import 'package:gepet_app/app/model/usuario_model.dart';
import 'package:gepet_app/app/model/vacina_model.dart';
import 'package:gepet_app/app/repository/base_repository.dart';

class ManagementRepository {
  final BaseRepository _baseRepository;

  ManagementRepository(this._baseRepository);

  // GET
  listUsers() {
    return _baseRepository.get(endpoint: "/usuario/todos");
  }

  listVax() {
    return _baseRepository.get(endpoint: "/vacina/todos");
  }

  listUserByName(String name) {
    return _baseRepository.get(
      endpoint: "/usuario",
      parameters: {"nome": name},
    );
  }

  listPets(String userId) {
    return _baseRepository.get(
      endpoint: "/animal/todos",
      parameters: {"idDono": userId},
    );
  }

  // POST
  addUser(UsuarioModel model) {
    return _baseRepository.post(
      endpoint: "/usuario/novo",
      body: model.toJson(),
    );
  }

  addVax(VacinaModel model) {
    return _baseRepository.post(
      endpoint: "/vacina/novo",
      body: model.toJson(),
    );
  }

  addPet(AnimalModel model) {
    return _baseRepository.post(
      endpoint: "/animal/novo",
      body: model.toJson(),
    );
  }

  // PUT
  editUser(UsuarioModel model) {
    return _baseRepository.put(
      endpoint: "/usuario/editar",
      body: model.toJson(),
    );
  }

  editVax(VacinaModel model) {
    return _baseRepository.put(
      endpoint: "/vacina/editar",
      body: model.toJson(),
    );
  }

  editPet(AnimalModel model) {
    return _baseRepository.put(
      endpoint: "/animal/editar",
      body: model.toJson(),
    );
  }

  // DELETE
  removeUser(String id) {
    return _baseRepository.delete(
      endpoint: "/usuario/excluir",
      query: {"id": id},
    );
  }

  removeVax(String id) {
    return _baseRepository.delete(
      endpoint: "/vacina/excluir",
      query: {"id": id},
    );
  }

  removePet(String id) {
    return _baseRepository.delete(
      endpoint: "/animal/excluir",
      query: {"id": id},
    );
  }
}
