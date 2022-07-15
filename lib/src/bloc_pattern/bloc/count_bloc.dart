import 'dart:async';

class CountBloc {
  CountEventBloc countEventBloc = CountEventBloc();
  int _count = 0;
  final StreamController<int> _countSubject = StreamController<int>();
  Stream<int> get count => _countSubject.stream;

  CountBloc() {
    countEventBloc._countEventSubject.stream.listen(_countEventListen);
  }

  _countEventListen(CountEvent event) {
    switch (event) {
      case CountEvent.ADD_EVENT:
        _count++;
        break;
      case CountEvent.SUBTRACT_EVENT:
        _count--;
        break;
    }
    _countSubject.sink.add(_count);
  }
}

class CountEventBloc {
  final StreamController<CountEvent> _countEventSubject =
      StreamController<CountEvent>();
}

enum CountEvent { ADD_EVENT, SUBTRACT_EVENT }
