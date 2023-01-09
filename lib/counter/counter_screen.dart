
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Center(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  "Counter",
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: 16.0,
                ),
                BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    return Text(
                      state.count.toString(),
                      style: Theme.of(context).textTheme.headline1,
                    );
                  },
                ),
              ],
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  TextButton(
                    child: const Text('Increment'),
                    onPressed: () {context.read<CounterBloc>().add(Increment());}
                  ),
                  TextButton(
                    child: const Text('Decrement'),
                    onPressed: () {context.read<CounterBloc>().add(Decrement());},
                  ),
                  TextButton(
                    child: const Text('Reset'),
                    onPressed: () {context.read<CounterBloc>().add(Reset());},
                  )

                ]
            )
          ],
        ),
      );
  }
}