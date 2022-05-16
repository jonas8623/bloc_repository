
import 'package:repository_bloc/model/client_model.dart';

class ClientRepository {

  final List<ClientModel> _clientsRepository = [];

  List<ClientModel> loadClients() {
    _clientsRepository.addAll([
      ClientModel(name: 'Jonas'),
      ClientModel(name: 'Carlos'),
      ClientModel(name: 'Miguel'),
      ClientModel(name: 'Moacir'),
      ClientModel(name: 'Guilherme'),
    ]);
    return _clientsRepository;
  }

  List<ClientModel> addClient(ClientModel client) {
    _clientsRepository.add(client);
    return _clientsRepository;
  }

  List<ClientModel> removeClient(ClientModel client) {
    _clientsRepository.remove(client);
    return _clientsRepository;
  }

}