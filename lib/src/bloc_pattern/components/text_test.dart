import 'package:bloc_practice/src/bloc_pattern/bloc/count_bloc.dart';
import 'package:bloc_practice/src/bloc_pattern/ui/bloc_practice.dart';
import 'package:flutter/material.dart';

class TextTest extends StatelessWidget {
  const TextTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: countBloc!.string,
      initialData: 'test',
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
