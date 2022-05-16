
import 'package:repository_bloc/model/client_model.dart';

abstract class ClientState {

  List<ClientModel> clientsS;

  ClientState({required this.clientsS});
}

class ClientInitialState extends ClientState {

  ClientInitialState() : super(clientsS: []);
}

class ClientSuccessState extends ClientState {

  ClientSuccessState({required List<ClientModel> clients}) : super(clientsS: clients);

}

