import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'isolated_bloc.dart';
import 'isolated_event.dart';
import 'isolated_state.dart';

class IsolatedPage extends StatelessWidget {
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
                "Isolated",
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(
                height: 16.0,
              ),
              BlocBuilder<IsolatedBloc, IsolatedState>(
                builder: (context, state) {
                  return state.isLoading
                    ? new CircularProgressIndicator()
                    : Text(
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
                    onPressed: () {context.read<IsolatedBloc>().add(StartCompute());}
                ),
              ]
          )
        ],
      ),
    );
  }
}