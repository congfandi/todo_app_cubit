import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'testing_bloc.dart';
import 'testing_event.dart';
import 'testing_state.dart';

class TestingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TestingBloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<TestingBloc>(context);

    return Container();
  }
}

