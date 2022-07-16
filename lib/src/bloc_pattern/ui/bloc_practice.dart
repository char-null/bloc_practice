import 'package:bloc_practice/src/bloc_pattern/bloc/count_bloc.dart';
import 'package:bloc_practice/src/bloc_pattern/components/count_view.dart';
import 'package:bloc_practice/src/bloc_pattern/components/text_test.dart';
import 'package:flutter/material.dart';

CountBloc? countBloc;

class BlocPractice extends StatefulWidget {
  const BlocPractice({Key? key}) : super(key: key);

  @override
  State<BlocPractice> createState() => _BlocPracticeState();
}

class _BlocPracticeState extends State<BlocPractice> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countBloc = CountBloc();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    countBloc!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("bloc practice page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CountView(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  countBloc!.countEventBloc.countEventSink
                      .add(CountEvent.ADD_EVENT);
                },
                child: Text(
                  "+",
                  style: TextStyle(fontSize: 80),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  countBloc!.countEventBloc.countEventSink
                      .add(CountEvent.SUBTRACT_EVENT);
                },
                child: Text(
                  "-",
                  style: TextStyle(fontSize: 80),
                ),
              ),
            ],
          ),
          TextTest(),
          Row(
            children: [
              MaterialButton(
                onPressed: () {
                  countBloc!.countEventBloc.textEventSink.add(TextEvent.DELETE);
                },
                child: Text("지우기"),
              ),
              MaterialButton(
                onPressed: () {
                  countBloc!.countEventBloc.textEventSink.add(TextEvent.TEST);
                },
                child: Text("test 넣기"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
