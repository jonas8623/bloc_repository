import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository_bloc/bloc/client_bloc.dart';
import 'package:repository_bloc/bloc/client_event.dart';
import 'package:repository_bloc/bloc/client_state.dart';
import 'package:repository_bloc/model/client_model.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late final ClientBloc bloc;

  String randomName() {
    final random = Random();
    return ['Jose', 'Silva', 'Beatriz', 'Rafael'].elementAt(random.nextInt(4));
  }

  @override
  void initState() {
    bloc = ClientBloc();
    bloc.add(LoadClientEvent());
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add_alt_1_rounded),
            onPressed: () {
              bloc.add(AddClientEvent(clientModel: ClientModel(name: randomName())));
            },
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: BlocBuilder(
            bloc: bloc,
            builder: (context, state) {
              if (state is ClientInitialState) {
                return const Center(child: CircularProgressIndicator(),);
              } else if (state is ClientSuccessState) {
                    final clientsList = state.clientsS;
                    return ListView.separated(
                      itemCount: clientsList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            child: ClipRRect(
                              child: Text(clientsList[index].name.substring(0, 1)),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          title: Text(clientsList[index].name),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                                  bloc.add(RemoveClientEvent(clientModel: clientsList[index]));
                            },
                          ),
                        );
                      },
                      separatorBuilder: (_,__) => const Divider(),
                   );
              }
              return Container();
            }),
      ),
    );
  }
}