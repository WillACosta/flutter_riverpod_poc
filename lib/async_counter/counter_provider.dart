import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'counter_state.dart';

final counterProvider =
    StateNotifierProvider<AsyncCounterState, AsyncValue<int>>(
  (ref) => AsyncCounterState(),
);
