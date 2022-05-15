import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todos/github/presentation/container/github_notifier.dart';

import '../../domain/usecases/_usecases.dart';
import 'github_state.dart';

final githubProvider = StateNotifierProvider<GithubNotifier, GithubState>(
  (ref) {
    return GithubNotifier(ref.watch(getRepositoriesUsecaseProvider));
  },
);
