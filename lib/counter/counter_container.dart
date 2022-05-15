import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterContainer extends StateNotifier<int> {
  CounterContainer(this.ref) : super(0);

  // com o ref, podemos ler dados de outros providers
  final Ref ref;

  void increment() => state++;
  void decrement() => state--;
}

class AsyncCounterState extends StateNotifier<AsyncValue<int>> {
  AsyncCounterState() : super(const AsyncData(0));

  void increment(int value) async {
    state = const AsyncLoading();

    state = await Future.delayed(
      const Duration(seconds: 2),
      () => AsyncData(value + 1),
    );
  }
}
