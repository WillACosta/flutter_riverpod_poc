class MainState<T> {
  MainState();

  // factory MainState.init() => InitState<T>;
}

abstract class InitState<T> extends MainState<T> {}
