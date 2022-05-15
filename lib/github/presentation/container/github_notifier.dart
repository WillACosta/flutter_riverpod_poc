import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/_usecases.dart';
import 'github_state.dart';

class GithubNotifier extends StateNotifier<GithubState> {
  final GetRepositories _usecase;

  GithubNotifier(this._usecase) : super(const InitialState());

  void _setState(GithubState newState) => state = newState;

  Future<void> getRepositories(String userName) async {
    _setState(const LoadingState());

    try {
      final result = await _usecase(userName);
      _setState(LoadedState(result));
    } catch (e) {
      _setState(const ErrorState());
    }
  }
}
