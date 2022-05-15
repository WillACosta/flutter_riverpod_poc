import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncCounterState extends StateNotifier<AsyncValue<int>> {
  AsyncCounterState() : super(const AsyncData(0));

  void increment(int value) async {
    state = const AsyncLoading();

    state = await Future.delayed(
      const Duration(seconds: 2),
      () => AsyncData(value + 1),
    );
  }

  void decrement(int value) async {
    state = const AsyncLoading();

    state = await Future.delayed(
      const Duration(seconds: 2),
      () => AsyncData(value - 1),
    );
  }
}
