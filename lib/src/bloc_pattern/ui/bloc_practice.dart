import 'package:bloc_practice/src/bloc_pattern/components/count_view.dart';
import 'package:flutter/material.dart';

class BlocPractice extends StatefulWidget {
  const BlocPractice({Key? key}) : super(key: key);

  @override
  State<BlocPractice> createState() => _BlocPracticeState();
}

class _BlocPracticeState extends State<BlocPractice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("bloc practice page"),
      ),
      body: Column(
        children: [
          CountView(),
          Row(
            children: [
              MaterialButton(
                onPressed: () {},
                child: Text(
                  "+",
                  style: TextStyle(fontSize: 40),
                ),
              ),
              MaterialButton(
                onPressed: () {},
                child: Text(
                  "-",
                  style: TextStyle(fontSize: 40),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
