import '../entity/github_repo.dart';

abstract class GithubRepository {
  Future<List<GithubRepo>> getRepositories(String userName);
}
