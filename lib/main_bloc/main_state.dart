part of counter.main_bloc;

@immutable
abstract class MainState {
  final num total;

  MainState() : total = 0;
  MainState.copyWith(num total) : total = total ?? 0;

  @override
  String toString() => '$runtimeType $total';
}

class InitApp extends MainState {}

class ValueChangedState extends MainState {
  @override
  final num total;

  ValueChangedState(this.total) : assert(total != null, "Count must not null");
}
