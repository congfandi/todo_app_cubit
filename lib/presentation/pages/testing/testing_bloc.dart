import 'package:bloc/bloc.dart';

import 'testing_event.dart';
import 'testing_state.dart';

class TestingBloc extends Bloc<TestingEvent, TestingState> {
  TestingBloc() : super(TestingState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<TestingState> emit) async {
    emit(state.clone());
  }
}
