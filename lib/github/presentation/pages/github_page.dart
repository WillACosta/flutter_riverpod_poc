import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todos/github/presentation/container/github_container.dart';
import 'package:riverpod_todos/github/presentation/container/github_state.dart';

class GithubPage extends StatelessWidget {
  GithubPage({Key? key}) : super(key: key);

  final _controller = TextEditingController();
  Timer? _debounce;

  void getRepositories(WidgetRef ref) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      ref.read(githubProvider.notifier).getRepositories(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Github Repos'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Consumer(
              builder: (_, ref, __) {
                return TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    suffix: IconButton(
                      onPressed: () => getRepositories(ref),
                      icon: const Icon(Icons.search),
                    ),
                  ),
                  onChanged: (value) => getRepositories(ref),
                );
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Consumer(
                builder: ((_, ref, __) {
                  final state = ref.watch(githubProvider);

                  if (state is InitialState) {
                    return const Center(
                      child: Text(
                        'Pesquise por um nome de usuário...',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  }

                  if (state is LoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is LoadedState) {
                    return ListView.builder(
                      itemCount: state.repos.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.repos[index].name),
                          subtitle: Text(state.repos[index].nodeId),
                        );
                      },
                    );
                  }

                  return const Center(
                    child: SizedBox(
                      width: 200,
                      child: Text(
                        'Não encontramos nenhum repositório para este usuário :(',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
