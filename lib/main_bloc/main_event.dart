part of counter.main_bloc;

@immutable
abstract class MainEvent {
  @override
  String toString() => 'MainEvent';
}

class OnIncreaseEvent extends MainEvent {
  final int delta;

  OnIncreaseEvent(this.delta);
}

class OnDecreaseEvent extends MainEvent {
  final int delta;

  OnDecreaseEvent(this.delta);
}
