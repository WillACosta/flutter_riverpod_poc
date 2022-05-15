import 'dart:convert';

import '../../domain/entity/github_repo.dart';
import '../../domain/repositories/github_repository.dart';
import '../../interface/_interface.dart';

class CGithubRepository implements GithubRepository {
  final HttpClientApp _httpClient;

  CGithubRepository(this._httpClient);

  @override
  Future<List<GithubRepo>> getRepositories(String userName) async {
    final response = await _httpClient.get(
      'https://api.github.com/users/$userName/repos',
    );

    final parsedBody = json.decode(response.body) as List<dynamic>;

    return (parsedBody).map((repo) => GithubRepo.fromJson(repo)).toList();
  }
}
