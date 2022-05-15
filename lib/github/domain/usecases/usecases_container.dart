import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_todos/github/domain/usecases/get_repositories/c_get_user_repositories.dart';
import 'package:riverpod_todos/github/domain/usecases/get_repositories/get_repositories.dart';

import '../../data/_data.dart';

final getRepositoriesUsecaseProvider = Provider<GetRepositories>(
  (ref) {
    return CGetRepositories(ref.watch(repositoryProvider));
  },
);
