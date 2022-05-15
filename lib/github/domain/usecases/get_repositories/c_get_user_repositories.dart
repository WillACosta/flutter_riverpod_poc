import 'package:riverpod_todos/github/domain/entity/github_repo.dart';

import '../../repositories/github_repository.dart';
import 'get_repositories.dart';

class CGetRepositories implements GetRepositories {
  final GithubRepository _repository;

  CGetRepositories(this._repository);

  @override
  Future<List<GithubRepo>> call(String username) async {
    return await _repository.getRepositories(username);
  }
}
