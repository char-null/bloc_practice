import 'package:bloc_practice/src/bloc_pattern/bloc/count_bloc.dart';
import 'package:flutter/material.dart';

class CountView extends StatelessWidget {
  const CountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {},
      stream: countbloc.count,
    );
  }
}
