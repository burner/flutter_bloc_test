import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'random_bloc.dart';
import 'random_event.dart';
import 'random_state.dart';

class RandomPage extends StatelessWidget {
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
                "Random",
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(
                height: 16.0,
              ),
              BlocBuilder<RandomBloc, RandomState>(
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
                    onPressed: () {context.read<RandomBloc>().add(Randomize());}
                ),
              ]
          )
        ],
      ),
    );
  }
}