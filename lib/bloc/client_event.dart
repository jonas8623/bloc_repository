
import 'package:repository_bloc/model/client_model.dart';

abstract class ClientEvent {}

class LoadClientEvent extends ClientEvent {}

class AddClientEvent extends ClientEvent {

  ClientModel clientModel;

  AddClientEvent({required this.clientModel});
}

class RemoveClientEvent extends ClientEvent {

  ClientModel clientModel;

  RemoveClientEvent({required this.clientModel});
}