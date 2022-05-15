import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/repositories/github_repository.dart';

import '../interface/_interface.dart';
import 'repository/github_repository.dart';

final repositoryProvider = Provider<GithubRepository>(
  (ref) => CGithubRepository(ref.watch(httpProvider)),
);
