library counter.main_bloc;

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  @override
  MainState get initialState => InitApp();


  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    switch (event.runtimeType) {
      case OnIncreaseEvent:
        yield _onIncrease(event);
        break;
      case OnDecreaseEvent:
        yield _onDecrease(event);
        break;
      default:
    }
  }

  MainState _onIncrease(OnIncreaseEvent event) {
    final num total = state.total + event.delta;
    return ValueChangedState(total);
  }

  MainState _onDecrease(OnDecreaseEvent event) {
    final num total = state.total - event.delta;
    return ValueChangedState(total);
  }
}
