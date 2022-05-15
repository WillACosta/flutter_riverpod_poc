import '../../entity/github_repo.dart';

abstract class GetRepositories {
  Future<List<GithubRepo>> call(String username);
}
