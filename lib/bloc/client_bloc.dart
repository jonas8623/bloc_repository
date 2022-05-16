import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository_bloc/bloc/client_event.dart';
import 'package:repository_bloc/bloc/client_state.dart';
import 'package:repository_bloc/repository/client_repository.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {

  final _clientRepository = ClientRepository();

  ClientBloc() : super(ClientInitialState()) {

    on<LoadClientEvent>(
          (event, emit) => emit(ClientSuccessState(clients: _clientRepository.loadClients())),
    );

    on<AddClientEvent>(
          (event, emit) => emit(ClientSuccessState(clients: _clientRepository.addClient(event.clientModel))),
    );

    on<RemoveClientEvent>(
          (event, emit) => emit(ClientSuccessState(clients: _clientRepository.removeClient(event.clientModel))),
    );
  }
}