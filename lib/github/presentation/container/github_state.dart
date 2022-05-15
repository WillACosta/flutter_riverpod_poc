import '../../domain/entity/github_repo.dart';

abstract class GithubState {
  const GithubState();
}

class InitialState extends GithubState {
  const InitialState();
}

class LoadingState extends GithubState {
  const LoadingState();
}

class LoadedState extends GithubState {
  final List<GithubRepo> repos;

  const LoadedState(this.repos);
}

class ErrorState extends GithubState {
  final String? error;

  const ErrorState({this.error});
}
