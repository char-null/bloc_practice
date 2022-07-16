import 'package:bloc_practice/src/bloc_pattern/bloc/count_bloc.dart';
import 'package:bloc_practice/src/bloc_pattern/ui/bloc_practice.dart';
import 'package:flutter/material.dart';

class CountView extends StatelessWidget {
  const CountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: 0,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          if (snapshot.hasData) {
            return Text(
              snapshot.data.toString(),
              style: const TextStyle(
                fontSize: 80,
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        stream: countBloc!.count);
  }
}
